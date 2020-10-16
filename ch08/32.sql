SELECT
  MAX(duration) AS longest_duration
  , COUNT(*) AS num_trips
  , AVG(duration) AS average_duration
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire