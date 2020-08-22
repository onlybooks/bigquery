SELECT
  COUNT(*)
  , start_station_name
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
GROUP BY 2
ORDER BY 1 DESC
LIMIT 10