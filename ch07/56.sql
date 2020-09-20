CREATE OR REPLACE TABLE ch07eu.cycle_hire_2015 AS (
  SELECT * FROM `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE EXTRACT(YEAR from start_date) = 2015
)