SELECT 
	bikeid,
	tripduration,
	gender
FROM
  `bigquery-public-data`.new_york_citibike.citibike_trips
WHERE gender = ""
LIMIT 100