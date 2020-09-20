SELECT name, zipcode
FROM `bigquery-public-data`.utility_us.zipcode_area
JOIN `bigquery-public-data`.utility_us.us_cities_area
ON ST_INTERSECTS(ST_GeogFromText(zipcode_geom), city_geom)
WHERE name LIKE '%Santa Fe%'