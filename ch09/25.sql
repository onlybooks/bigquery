CREATE OR REPLACE MODEL ch09eu.bicycle_model_fc_geo
TRANSFORM(duration
  , ML.FEATURE_CROSS(STRUCT(
    IF(EXTRACT(dayofweek FROM start_date) BETWEEN 2 AND 6, 'weekday', 'weekend') AS dayofweek,
    ML.BUCKETIZE(EXTRACT(HOUR FROM start_date), [5, 10, 17]) AS hr
)) AS dayhr
  , ST_GeoHash(ST_GeogPoint(latitude, longitude), 4) AS start_station_loc4
  , ST_GeoHash(ST_GeogPoint(latitude, longitude), 6) AS start_station_loc6
  , ST_GeoHash(ST_GeogPoint(latitude, longitude), 8) AS start_station_loc8
)
OPTIONS(input_label_cols=['duration'], model_type='linear_reg')
AS

SELECT
  duration
  , latitude
  , longitude
  , start_date
FROM `bigquery-public-data`.london_bicycles.cycle_hire
JOIN `bigquery-public-data`.london_bicycles.cycle_stations
ON cycle_hire.start_station_id = cycle_stations.id