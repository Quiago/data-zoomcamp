SELECT (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_01`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_02`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_03`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_04`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_05`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_06`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_07`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_08`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_09`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_10`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_11`
) + (
    SELECT COUNT(1) FROM `kestra-sandbox-449505.demo_dataset.green_tripdata_2020_12`
) as total_count;