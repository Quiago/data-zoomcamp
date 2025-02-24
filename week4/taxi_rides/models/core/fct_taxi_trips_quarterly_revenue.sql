{{ config(materialized="table") }}

with
    trips_data as (select * from {{ ref("fact_trips") }}),
    quarterly_revenue as (
        select
            sum(total_amount) as revenue,
            lag(sum(total_amount)) over (
                partition by service_type, quarter order by year
            ) as previous_quarter_year,
            year,
            quarter,
            service_type
        from trips_data
        group by year, quarter, service_type
    )

select year, quarter, service_type, revenue as quarter_revenue, previous_quarter_year,
case 
    when previous_quarter_year is null then null
    when previous_quarter_year = 0 then null
    else (revenue - previous_quarter_year) / previous_quarter_year * 100

end as revenue_growth

from quarterly_revenue
order by year, quarter
