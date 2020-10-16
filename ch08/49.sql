CREATE OR REPLACE TABLE ch08eu.hydepark_stations
OPTIONS(
  expiration_timestamp=TIMESTAMP "2020-01-01 00:00:00 UTC",
  description="Stations with Hyde Park in the name",
  labels=[("cost_center", "abc123")]
) AS
SELECT
  * EXCEPT(longitude, latitude)
  , ST_GeogPoint(longitude, latitude) AS location
FROM `bigquery-public-data.london_bicycles.cycle_stations`
WHERE name LIKE '%Hyde%'