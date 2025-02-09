CREATE OR REPLACE EXTERNAL TABLE `kestra-sandbox-449505.demo_dataset.2024_external_yellow_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://vivid-layout-448602-n1-terra-bucket/yellow_tripdata_2024-*.parquet']
);

