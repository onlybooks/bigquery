%%bigquery badtrips --project $PROJECT

WITH all_bad_trips AS (
  SELECT
    start_station_name
    , COUNTIF(duration < 600 AND start_station_name = end_station_name) AS bad_trips
    , COUNT(*) AS num_trips
  FROM `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE EXTRACT(YEAR FROM start_date) = 2015
  GROUP BY start_station_name
  HAVING num_trips > 10
)
SELECT *, bad_trips / num_trips AS fraction_bad FROM all_bad_trips
ORDER BY fraction_bad DESC