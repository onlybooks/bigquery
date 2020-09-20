CREATE OR REPLACE TABLE ch07eu.cycle_hire_partitioned
  PARTITION BY DATE(start_date) AS
SELECT * FROM `bigquery-public-data`.london_bicycles.cycle_hire