SELECT
  time_series_id AS start_station_name,
  forecast_timestamp, forecast_value
FROM ML.FORECAST(MODEL ch09eu.numrentals_forecast),
                  STRUCT(3 AS horizon, 0.9 AS confidence_level))
ORDER BY time_series_id, forecast_timestamp