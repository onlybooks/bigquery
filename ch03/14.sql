WITH example AS (
  SELECT 'John' as employee, 'Paternity Leave' AS hours_worked
  UNION ALL SELECT 'Janaki', '35'
  UNION ALL SELECT 'Jian', 'Vacation'
  UNION ALL SELECT 'Jose', '40'
)
SELECT SUM(hours_worked) from example