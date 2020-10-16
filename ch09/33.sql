CREATE OR REPLACE TABLE ch09eu.stationstats AS
WITH hires AS (
  SELECT
    h.start_station_name as station_name,
    IF(EXTRACT(DAYOFWEEK FROM h.start_date) BETWEEN 2 and 6, "weekday", "weekend") as isweekday,
    h.duration,
    s.bikes_count,
    ST_DISTANCE(ST_GEOGPOINT(s.longitude, s.latitude),
    ST_GEOGPOINT(-0.1, 51.5))/1000 as distance_from_city_center
  FROM `bigquery-public-data.london_bicycles.cycle_hire` as h
  JOIN `bigquery-public-data.london_bicycles.cycle_stations` as s
  ON h.start_station_id = s.id
  WHERE EXTRACT(YEAR from start_date) = 2015
),

stationstats AS (
  SELECT
    station_name,
    AVG(IF(isweekday = 'weekday', duration, NULL)) AS duration_weekdays,
    AVG(IF(isweekday = 'weekend', duration, NULL)) AS duration_weekends,
    COUNT(IF(isweekday = 'weekday', duration, NULL)) AS numtrips_weekdays,
    COUNT(IF(isweekday = 'weekend', duration, NULL)) AS numtrips_weekends,
    MAX(bikes_count) AS bikes_count,
    MAX(distance_from_city_center) AS distance_from_city_center
  FROM hires
  GROUP BY station_name
)

SELECT *
FROM stationstats