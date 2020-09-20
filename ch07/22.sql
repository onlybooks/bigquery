SELECT
  name
  , number AS num_babies
FROM `bigquery-public-data`.usa_names.usa_1910_current
WHERE gender = 'M' AND year = 2015 AND state = 'MA'
ORDER BY num_babies DESC
LIMIT 5