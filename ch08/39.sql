WITH longest_trips AS (
  SELECT
    start_station_id
    , duration
    , RANK()
        OVER(PARTITION BY start_station_id ORDER BY duration DESC) AS nth_longest
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
)
SELECT
  start_station_id
  , ARRAY_AGG(duration ORDER BY nth_longest LIMIT 3) AS durations
FROM
  longest_trips
GROUP BY start_station_id
LIMIT 5