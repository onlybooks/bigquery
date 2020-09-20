WITH example AS (
  SELECT 'Sat' AS day, 1451 AS numrides, 1018 AS oneways
  UNION ALL SELECT 'Sun', 2376, 936
  UNION ALL SELECT 'Mon', NULL, NULL
  UNION ALL SELECT 'Tue', IEEE_Divide(-3,0), 0  -- this is -inf,0
)
SELECT * from example
ORDER BY numrides

SELECT * from example
WHERE numrides < 2000