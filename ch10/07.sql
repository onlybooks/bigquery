CREATE OR REPLACE TABLE ch10eu.restored_cycle_stations AS
SELECT
  *
FROM `bigquery-public-data`.london_bicycles.cycle_stations
FOR SYSTEM_TIME AS OF
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 24 HOUR)
