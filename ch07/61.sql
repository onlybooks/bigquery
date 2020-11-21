SELECT
  start_station_name
  , AVG(duration) AS avg_duration
FROM `ch07eu.cycle_hire_*`
WHERE _TABLE_SUFFIX BETWEEN '2015' AND '2016'
GROUP BY start_station_name
ORDER BY avg_duration DESC
LIMIT 5