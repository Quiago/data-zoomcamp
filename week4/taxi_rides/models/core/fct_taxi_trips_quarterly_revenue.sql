{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
)
select sum(fare_amount) as revenue_quarter_fare, year, quarter
from trips_data
group by year, quarter
    