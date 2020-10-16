CREATE OR REPLACE TABLE ch08eu.hydepark_stations AS
SELECT
  * EXCEPT(longitude, latitude)
  , ST_GeogPoint(longitude, latitude) AS location
FROM `bigquery-public-data`.london_bicycles.cycle_stations
WHERE name LIKE '%Hyde%'