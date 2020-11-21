-- 올바른 구문이 아니다! (다음 절 참고)
SELECT * FROM ML.PREDICT(MODEL ch09eu.bicycle_model_bucketized,
  (SELECT 'Park Lane , Hyde Park' AS start_station_name
    , 'weekday' AS dayofweek, '17' AS hourofday)
  )