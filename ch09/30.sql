CREATE OR REPLACE MODEL ch09eu.numrentals_forecast
OPTIONS(model_type='ARIMA',
        time_series_data_col='numrentals',
        time_series_timestamp_col='date',
        time_series_id_col='start_station_name') AS
SELECT
  start_station_name
  , CAST(EXTRACT(date FROM start_date) AS TIMESTAMP) AS date
  , COUNT(*) AS numrentals
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
WHERE start_station_name LIKE '%Hyde%' -- 하이드 공원의 모든 대여소
GROUP BY date
HAVING date BETWEEN '2015-05-01' AND '2015-06-15'