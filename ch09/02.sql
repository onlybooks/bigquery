SELECT
  EXTRACT(dayofweek FROM start_date) AS dayofweek
  , AVG(duration) AS duration
FROM `bigquery-public-data`.london_bicycles.cycle_hire
GROUP BY dayofweek