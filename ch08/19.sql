SELECT
  start_date,
  COUNT(*) AS num_long_trips
FROM -- "first from"
  (SELECT
    start_station_name
    , duration
    , EXTRACT(DATE from start_date) AS start_date
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE
    start_station_name = end_station_name) AS roundtrips
WHERE -- "outer where"
  duration > 2*(
    SELECT
    AVG(duration) as avg_duration
    FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
    WHERE
    start_station_name = end_station_name
    AND roundtrips.start_station_name = start_station_name
)
GROUP BY start_date
ORDER BY num_long_trips DESC
LIMIT 5