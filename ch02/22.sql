SELECT
  city, SPLIT(city, ' ') AS parts
FROM (
  SELECT * from UNNEST([
    'Seattle WA', 'New York', 'Singapore'
  ]) AS city
)