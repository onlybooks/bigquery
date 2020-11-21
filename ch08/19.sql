SELECT
  start_date,
  COUNT(*) AS num_long_trips
FROM -- "첫 번째 FROM 절"
  (SELECT
    start_station_name
    , duration
    , EXTRACT(DATE FROM start_date) AS start_date
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE
    start_station_name = end_station_name) AS roundtrips
WHERE -- "바깥쪽의 WHERE"
  duration > 2*(
    SELECT
      AVG(duration) AS avg_duration
    FROM
      `bigquery-public-data`.london_bicycles.cycle_hire
    WHERE
      start_station_name = end_station_name
      AND roundtrips.start_station_name = start_station_name
)
GROUP BY start_date
ORDER BY num_long_trips DESC
LIMIT 5