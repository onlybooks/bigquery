CREATE OR REPLACE TABLE ch07eu.cycle_hire_clustered
  PARTITION BY DATE(start_date)
  CLUSTER BY start_station_name, end_station_name
AS (
  SELECT * FROM `bigquery-public-data`.london_bicycles.cycle_hire
)