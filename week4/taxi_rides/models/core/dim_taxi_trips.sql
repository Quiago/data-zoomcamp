{{
    config(
        materialized='table'
    )
}}

with green_tripdata as (
    select *, 
        'Green' as service_type
    from {{ ref('stg_green_tripdata') }}
), 
yellow_tripdata as (
    select *, 
        'Yellow' as service_type
    from {{ ref('stg_yellow_tripdata') }}
), trips_unioned as (
    select * from green_tripdata
    union all 
    select * from yellow_tripdata
), 
dim_taxi_trips as (
    select
    *,
    {{ dbt_date.year('pickup_datetime') }} as year,
    {{ dbt_date.quarter('pickup_datetime') }} as quarter,
    concat({{ dbt_date.year('pickup_datetime') }}, '-Q', {{ dbt_date.quarter('date_day') }}) as year_quarter,
    {{ dbt_date.month('pickup_datetime') }} as month,
    {{ dbt_date.month_name('pickup_datetime') }} as month_name
    from trips_unioned 
)

select * from dim_taxi_trips