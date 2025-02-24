{{ config(materialized='table') }}

WITH trips_data AS (
    SELECT * FROM {{ ref('fact_trips') }}
), 
quarterly_revenue AS (
    SELECT 
        EXTRACT(YEAR FROM pickup_datetime) AS year,
        EXTRACT(QUARTER FROM pickup_datetime) AS quarter,
        SUM(fare_amount) AS quarterly_revenue
    FROM trips_data
    GROUP BY year, quarter
)

SELECT
    year,
    quarter,
    quarterly_revenue,
    LAG(quarterly_revenue) OVER (PARTITION BY quarter ORDER BY year) AS previous_year_revenue,
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
    quarter
