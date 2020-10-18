SELECT
  start_date
  , end_date
  , LEAD(start_date, 1)
      OVER(PARTITION BY bike_id
        ORDER BY start_date ASC) AS next_rental_start
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5