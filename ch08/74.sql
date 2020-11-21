SELECT
  column_name,
  parse_date('_%m_%d_%y', column_name) AS date
FROM
  `bugquery-public-data`.covid19_jhu_csse.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = 'confirmed_cases' AND
  STARTS_WITH(column_name, '_')
ORDER BY date DESC LIMIT 3