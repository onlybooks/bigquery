SELECT
  start_station_name
  , AVG(duration) AS avg_duration
FROM ch07eu.cycle_hire_2015
GROUP BY start_station_name
ORDER BY avg_duration DESC
LIMIT 5