CREATE OR REPLACE TABLE ch07eu.london_bicycles_denorm AS
SELECT
  start_station_id
  , s.latitude AS start_latitude
  , s.longitude AS start_longitude
  , end_station_id
  , e.latitude AS end_latitude
  , e.longitude AS end_longitude
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire as h
JOIN
  `bigquery-public-data`.london_bicycles.cycle_stations as s
ON
  h.start_station_id = s.id
JOIN
  `bigquery-public-data`.london_bicycles.cycle_stations as e
ON
  h.end_station_id = e.id