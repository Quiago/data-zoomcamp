{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
), quarterly_revenue as (
select sum(fare_amount) as revenue, year, quarter
from trips_data
group by year, quarter
order by year, quarter
)

SELECT
    year,
    quarter,
    revenue,
    LAG(revenue) OVER (PARTITION BY quarter ORDER BY year) AS previous_year_revenue,
    CASE
    WHEN LAG(revenue) OVER (PARTITION BY quarter ORDER BY year) IS NULL THEN NULL
    ELSE
        (revenue - LAG(revenue) OVER (PARTITION BY quarter ORDER BY year)) /
        LAG(revenue) OVER (PARTITION BY quarter ORDER BY year) * 100
    END AS yoy_growth_percentage
FROM
    quarterly_revenue
ORDER BY
    year,
    quarter