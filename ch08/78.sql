WITH seattle AS (
  SELECT ANY_VALUE(internal_point) as loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Seattle' and state_code = 'WA'
),
miami AS (
  SELECT ANY_VALUE(internal_point) as loc
  FROM `bigquery-public-data`.geo_us_boundaries.us_zip_codes
  WHERE city = 'Miami city' and state_code = 'FL'
)

SELECT
  ST_Distance(seattle.loc, miami.loc)/1000 AS dist
FROM seattle, miami