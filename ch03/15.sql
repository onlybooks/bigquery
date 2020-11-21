WITH example AS (
  SELECT 'John' AS employee, 'Paternity Leave' AS hours_worked
  UNION ALL SELECT 'Janaki', '35'
  UNION ALL SELECT 'Jian', 'Vacation'
  UNION ALL SELECT 'Jose', '40'
)
SELECT SUM(SAFE_CAST(hours_worked AS INT64)) FROM example