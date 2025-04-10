CREATE OR REPLACE EXTERNAL TABLE `kestra-sandbox-449505.demo_dataset.2019_external_fhv_tripdata`
OPTIONS (
  format = 'CSV',
  uris = ['gs://vivid-layout-448602-n1-terra-bucket/fhv_tripdata_2019-*.csv']
);
CREATE OR REPLACE TABLE `kestra-sandbox-449505.demo_dataset.fhv_tripdata`
AS 
SELECT * FROM `kestra-sandbox-449505.demo_dataset.2019_external_fhv_tripdata`;

WITH green_trips_2019 AS (
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_01`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_02`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_03`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_04`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_05`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_06`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_07`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_08`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_09`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_10`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_11`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2019_12`
),
green_trips_2020 AS (
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_01`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_02`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_03`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_04`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_05`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_06`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_07`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_08`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_09`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_10`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_11`
    UNION ALL
    SELECT * FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_12`
), green_trips AS (
SELECT * FROM green_trips_2019
UNION ALL
SELECT * FROM green_trips_2020)
SELECT COUNT(1) FROM green_trips

