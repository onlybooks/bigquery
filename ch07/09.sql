SELECT
  start_station_name,
  AVG(duration) AS duration,
  COUNT(duration) AS num_trips
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
GROUP BY
  start_station_name
ORDER BY
  num_trips DESC
LIMIT
  5