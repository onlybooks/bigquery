SELECT * FROM ML.PREDICT(MODEL ch09eu.bicycle_model_longrental,
  (SELECT 'Park Lane , Hyde Park' AS start_station_name
          , TIMESTAMP('2019-05-09 16:16:00 UTC') AS start_date),
  STRUCT(0.144 AS threshold)
  )