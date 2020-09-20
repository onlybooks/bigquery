SELECT
  * EXCEPT(short_name, last_reported)
FROM
  `bigquery-public-data`.new_york_citibike.citibike_stations
WHERE name LIKE '%Riverside%'