SELECT
  APPROX_QUANTILES(duration, 100)[OFFSET(95)]
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire