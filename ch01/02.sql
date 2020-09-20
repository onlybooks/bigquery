SELECT 
  EXTRACT(YEAR FROM starttime) AS year,  
  EXTRACT(MONTH FROM starttime) AS month,  
  COUNT(starttime) AS number_one_way
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE  
  start_station_name != end_station_name
GROUP BY year, month
ORDER BY year ASC, month ASC