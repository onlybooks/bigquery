SELECT name, zipcode
FROM ch07.zipcode_area
JOIN `bigquery-public-data`.utility_us.us_cities_area
ON ST_INTERSECTS(zipcode_geom, city_geom)
WHERE name LIKE '%Santa Fe%'