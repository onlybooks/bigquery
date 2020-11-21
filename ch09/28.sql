SELECT * FROM ML.FORECAST(MODEL ch09eu.numrentals_forecast,
                 STRUCT(14 AS horizon, 0.9 AS confidence_level))