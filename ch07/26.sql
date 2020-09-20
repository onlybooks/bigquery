SELECT
  bike_id
  , start_date
  , end_date
  , TIMESTAMP_DIFF(
      start_date,
      LAG(end_date) OVER (PARTITION BY bike_id ORDER BY start_date),
      SECOND) AS time_at_station
FROM `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5