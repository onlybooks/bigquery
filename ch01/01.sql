SELECT
  EXTRACT(YEAR FROM starttime) AS year,  
  EXTRACT(MONTH FROM starttime) AS month,  
  COUNT(starttime) AS number_one_way
FROM  
  mydb.return_transactions
WHERE 
  start_station_name != end_station_name
GROUP BY year, month
ORDER BY year ASC, month ASC
