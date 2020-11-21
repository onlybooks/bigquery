SELECT
  z.zip_code
  , COUNT(*) AS num_stations
FROM
  `bigquery-public-data`.new_york.citibike_stations AS s,
  `bigquery-public-data`.geo_us_boundaries.us_zip_codes AS z
WHERE
  ST_DWithin(
    z.zcta_geom,
    ST_GeogPoint(s.longitude, s.latitude),
    1000) -- 1km
GROUP BY z.zip_code
ORDER BY num_stations DESC
LIMIT 5