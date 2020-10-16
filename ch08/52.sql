INSERT ch08eu.hydepark_rides
SELECT
  start_date AS start_time
  , duration
  , start_station_id
  , start_station_name
  , end_station_id
  , end_station_name
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
WHERE
  start_station_name LIKE '%Hyde%'