WITH example AS (
  SELECT 'John' AS employee, '0' AS hours_worked
  UNION ALL SELECT 'Janaki', '35'
  UNION ALL SELECT 'Jian', '0'
  UNION ALL SELECT 'Jose', '40'
)
SELECT SUM(CAST(hours_worked AS INT64)) FROM example