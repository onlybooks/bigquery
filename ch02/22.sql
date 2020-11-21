SELECT
  city, SPLIT(city, ' ') AS parts
FROM (
  SELECT * FROM UNNEST([
    'Seattle WA', 'New York', 'Singapore'
  ]) AS city
)