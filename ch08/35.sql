SELECT
  AVG(duration)
    OVER(PARTITION BY start_station_id
    ORDER BY UNIX_SECONDS(start_date) ASC
    RANGE BETWEEN 3600 PRECEDING AND CURRENT ROW) AS average_duration
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5