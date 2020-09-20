WITH all_trips AS (
  SELECT
  gender, tripduration / 60 AS minutes
  FROM
  `bigquery-public-data`.new_york_citibike.citibike_trips
)

SELECT * from all_trips
WHERE minutes < 10
LIMIT 5