WITH params AS (
  SELECT 600 AS DURATION_THRESH
)
SELECT
  start_station_name
  , COUNT(duration) AS num_trips
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
  , params
WHERE duration >= DURATION_THRESH
GROUP BY start_station_name
ORDER BY num_trips DESC
LIMIT 5