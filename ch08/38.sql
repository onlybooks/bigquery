SELECT
  start_station_id
  , duration
  , RANK()
      OVER(PARTITION BY start_station_id ORDER BY duration DESC) AS nth_longest
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5