WITH rentals_on_day AS (
SELECT
  rental_id
  , end_date
  , EXTRACT(DATE FROM end_date) AS rental_date
FROM `bigquery-public-data.london_bicycles.cycle_hire`
)

SELECT
  rental_id
  , rental_date
  , ROW_NUMBER() OVER(PARTITION BY rental_date ORDER BY end_date) AS
  rental_number_on_day
FROM rentals_on_day
ORDER BY rental_date ASC, rental_number_on_day ASC
LIMIT 5