SELECT
  MIN(start_station_name) AS start_station_name
  , MIN(end_station_name) AS end_station_name
  , APPROX_QUANTILES(duration, 10)[OFFSET(5)] AS typical_duration
  , COUNT(duration) AS num_trips
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
WHERE
  start_station_id != end_station_id
GROUP BY
  start_station_id, end_station_id
ORDER BY num_trips DESC
LIMIT 10