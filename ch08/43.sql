WITH columns AS (
  SELECT column_name
  FROM `bigquery-public-data`.irs_990.INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'irs_990_2015' AND column_name != 'ein'
)

SELECT CONCAT(
  'SELECT ein, ARRAY_AGG(STRUCT(',
  ARRAY_TO_STRING(ARRAY(SELECT column_name FROM columns), ',\n '),
  '\n) FROM `bigquery-public-data`.irs_990.irs_990_2015\n',
  'GROUP BY ein')