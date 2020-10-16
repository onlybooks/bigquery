ML.FEATURE_CROSS(STRUCT(
  IF(EXTRACT(dayofweek FROM start_date) BETWEEN 2 and 6, 'weekday', 'weekend') as dayofweek,
  ML.BUCKETIZE(EXTRACT(HOUR FROM start_date), [5, 10, 17]) AS hr
)) AS dayhr