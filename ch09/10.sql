-- INCORRECT! (see next section)
SELECT * FROM ML.PREDICT(MODEL ch09eu.bicycle_model_bucketized,
  (SELECT 'Park Lane , Hyde Park' AS start_station_name
    , 'weekday' AS dayofweek, '17' AS hourofday)
  )