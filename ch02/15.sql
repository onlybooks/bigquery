SELECT
  AVG(tripduration/60) AS avg_trip_duration
FROM
  `bigquery-public-data`.new_york_citibike.citibike_trips
WHERE
  gender = 'male'