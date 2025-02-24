{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
), quarterly_revenue as (
select sum(fare_amount) as quarterly_revenue, year, quarter
from trips_data
group by year, quarter
order by year, quarter
)

SELECT
    year,
    quarter,
    quarterly_revenue,
    previous_year_revenue,
    CASE
        WHEN previous_year_revenue IS NULL THEN NULL
        ELSE
            (CAST(quarterly_revenue AS NUMERIC) - CAST(previous_year_revenue AS NUMERIC)) /
            CAST(previous_year_revenue AS NUMERIC) * 100
    END AS yoy_growth_percentage
FROM
    quarterly_revenue
ORDER BY
    year,
    quarter;