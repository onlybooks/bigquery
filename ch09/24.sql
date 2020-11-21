ML.FEATURE_CROSS(STRUCT(
  IF(EXTRACT(dayofweek FROM start_date) BETWEEN 2 AND 6, 'weekday', 'weekend') AS dayofweek,
  ML.BUCKETIZE(EXTRACT(HOUR FROM start_date), [5, 10, 17]) AS hr
)) AS dayhr