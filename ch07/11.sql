SELECT
  bike_id
  , duration
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
ORDER BY duration DESC
LIMIT 1