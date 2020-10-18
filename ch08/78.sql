WITH seattle AS (
  SELECT ANY_VALUE(internal_point) AS loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Seattle' AND state_code = 'WA'
),
miami AS (
  SELECT ANY_VALUE(internal_point) AS loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Miami city' AND state_code = 'FL'
)

SELECT
  ST_Distance(seattle.loc, miami.loc)/1000 AS dist
FROM seattle, miami