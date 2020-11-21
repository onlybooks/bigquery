WITH roundtrips AS (
SELECT
  start_station_name
  , duration
  , EXTRACT(DATE FROM start_date) AS start_date
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
WHERE
  start_station_name = end_station_name
),
station_avg AS (
SELECT
  start_station_name
  , AVG(duration) as avg_duration
FROM
  roundtrips
GROUP BY start_station_name
)