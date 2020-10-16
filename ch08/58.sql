UPDATE ch08eu.hydepark_rides
SET duration = duration * 60
WHERE
  start_time > '2016-12-01' AND
  start_station_id = 303