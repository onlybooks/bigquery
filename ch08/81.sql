WITH seattle AS (
  SELECT ST_CENTROID_AGG(zcta_geom) AS loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Seattle' AND state_code = 'WA'
),
miami AS (
  SELECT ST_CENTROID_AGG(zcta_geom) AS loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Miami city' AND state_code = 'FL'
)

SELECT
  ST_Distance(seattle.loc, miami.loc)/1000 AS dist
FROM seattle, miami