WITH example AS (
  SELECT 'A' AS name, 32 AS age
  UNION ALL SELECT 'B', 32
  UNION ALL SELECT 'C', 33
  UNION ALL SELECT 'D', 33
  UNION ALL SELECT 'E', 34
)
SELECT
  name
  , age
  , RANK() OVER(ORDER BY age) AS rank
  , DENSE_RANK() OVER(ORDER BY age) AS dense_rank
  , ROW_NUMBER() OVER(ORDER BY age) AS row_number
FROM example