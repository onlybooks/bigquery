SELECT
  AVG(duration)
    OVER(ORDER BY start_date ASC
    ROWS BETWEEN 100 PRECEDING AND 1 PRECEDING) AS average_duration
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5