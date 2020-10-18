WITH seattle AS (
  SELECT ST_UNION_AGG(zcta_geom) AS loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Seattle' AND state_code = 'WA'
)