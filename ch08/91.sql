SELECT
  MIN(duration) AS min_dur
  , MAX(duration) AS max_dur
  , COUNT(duration) AS num_dur
  , AVG(duration) AS avg_dur
  , SUM(duration) AS total_dur
  , STDDEV(duration) AS stddev_dur
  , VARIANCE(duration) AS variance_dur
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire