WITH example AS (
  SELECT 1.23 AS payment
  UNION ALL SELECT 7.89
  UNION ALL SELECT 12.43
)
SELECT 
  SUM(payment) AS total_paid,
  AVG(payment) AS average_paid
FROM example