WITH example AS (
  SELECT * from unnest([
    'Seattle', 'New York', 'Singapore'
  ]) AS city
)
SELECT 
  city
  , LENGTH(city) AS len
  , LOWER(city) AS lower
  , STRPOS(city, 'or') AS orpos
FROM example