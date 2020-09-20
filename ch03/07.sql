WITH example AS (
  SELECT NUMERIC '1.23' AS payment
  UNION ALL SELECT NUMERIC '7.89'
  UNION ALL SELECT NUMERIC '12.43'
)
SELECT 
  SUM(payment) AS total_paid,
  AVG(payment) AS average_paid
FROM example