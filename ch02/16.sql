SELECT
  gender, AVG(tripduration/60) AS avg_trip_duration
FROM
  `bigquery-public-data`.new_york_citibike.citibike_trips
WHERE
  tripduration is not NULL
GROUP BY
  gender
ORDER BY
  avg_trip_duration