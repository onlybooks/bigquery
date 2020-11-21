CREATE OR REPLACE TABLE ch07eu.cycle_hire AS
SELECT
  start_station_name
  , end_station_name
  , ST_DISTANCE(ST_GeogPoint(s1.longitude, s1.latitude),
                ST_GeogPoint(s2.longitude, s2.latitude)) AS distance
  , duration
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire AS h
JOIN
  `bigquery-public-data`.london_bicycles.cycle_stations AS s1
ON h.start_station_id = s1.id
JOIN
  `bigquery-public-data`.london_bicycles.cycle_stations AS s2
ON h.end_station_id = s2.id