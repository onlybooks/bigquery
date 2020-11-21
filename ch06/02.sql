SELECT
  COUNT(*)
  , starts.start_station_id AS point_a
  , ends.start_station_id AS point_b
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire starts,
  `bigquery-public-data`.london_bicycles.cycle_hire ends
WHERE
  starts.start_station_id = ends.end_station_id
  AND ends.start_station_id = starts.end_station_id
  AND starts.start_station_id <> ends.start_station_id
  AND starts.start_date = ends.start_date
GROUP BY 2, 3
ORDER BY 1 DESC
LIMIT 10