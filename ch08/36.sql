SELECT
  start_date
  , end_date
  , LAST_VALUE(start_date)
      OVER(PARTITION BY bike_id
        ORDER BY start_date ASC
        ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS next_rental_start
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5