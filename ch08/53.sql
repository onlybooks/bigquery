WITH rides_in_year AS (
  SELECT
    EXTRACT(MONTH from start_time) AS month
    , duration
  FROM ch08eu.hydepark_rides
  WHERE
    DATE(start_time) BETWEEN '2016-01-01' AND '2016-12-31'
    AND start_station_id = 300
    AND end_station_id = 303
)
SELECT
  month
  , AVG(duration)/60 AS avg_duration_minutes
FROM rides_in_year
GROUP BY month
ORDER BY avg_duration_minutes DESC
LIMIT 5