CREATE OR REPLACE MATERIALIZED VIEW ch07eu.oneway_rentals
AS

WITH oneway AS (
  SELECT EXTRACT(date FROM start_date) AS rental_date,
  duration, start_station_name, end_station_name
  FROM
  ch07eu.cycle_hire
  WHERE start_station_name != end_station_name
)

SELECT
  rental_date, AVG(duration) AS avg_duration,
  start_station_name, end_station_name
FROM oneway
GROUP BY rental_date, start_station_name, end_station_name