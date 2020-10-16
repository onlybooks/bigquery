SELECT
  APPROX_QUANTILES(duration, 3)
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire