DECLARE tomorrow_3am TIMESTAMP;
SET tomorrow_3am = TIMESTAMP_ADD(
  TIMESTAMP(DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY)),
  INTERVAL 3 HOUR);

WITH generated AS (
  SELECT
    name AS start_station_name
    , GENERATE_TIMESTAMP_ARRAY(tomorrow_3am, TIMESTAMP_ADD(tomorrow_3am, INTERVAL 24 HOUR), INTERVAL 1 HOUR) AS dates
  FROM
  `bigquery-public-data`.london_bicycles.cycle_stations
),

features AS (
  SELECT
    start_station_name
    , start_date
  FROM
    generated
    , UNNEST(dates) AS start_date
)

SELECT * FROM ML.PREDICT(MODEL ch09eu.bicycle_model_bucketized,
  (SELECT * FROM features)
)