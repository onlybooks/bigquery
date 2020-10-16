SELECT
  start_date,
  COUNT(*) AS num_long_trips
FROM
  roundtrips
JOIN station_avg USING(start_station_name)
WHERE duration > 2*avg_duration
GROUP BY start_date
ORDER BY num_long_trips DESC
LIMIT 5