DELETE ch08eu.hydepark_rides
WHERE
  start_time > '2016-12-01' AND
  (duration IS NULL OR duration = 0)