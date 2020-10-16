SELECT
  start_day
  , COUNT(*) AS num_overnight_rentals
  , AVG(duration)/3600 AS avg_duration_hours
FROM
  overnight_trips
GROUP BY
  start_day
ORDER BY num_overnight_rentals DESC