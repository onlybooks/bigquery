SELECT DISTINCT 
  gender,
  usertype
FROM
  `bigquery-public-data`.new_york_citibike.citibike_trips
WHERE gender != ''