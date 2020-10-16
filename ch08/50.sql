CREATE OR REPLACE TABLE ch08eu.hydepark_rides
(
  start_time TIMESTAMP,
  duration INT64,
  start_station_id INT64,
  start_station_name STRING,
  end_station_id INT64,
  end_station_name STRING
)
PARTITION BY DATE(start_time)
CLUSTER BY start_station_id