WITH example AS (
  SELECT 'Sat' AS day, 1451 AS numrides, 1018 AS oneways
  UNION ALL SELECT 'Sun', 2376, 936
  UNION ALL SELECT 'Wed', 0, 0
)
SELECT 
   *, ROUND(IEEE_DIVIDE(oneways, numrides), 2)
AS frac_oneway FROM example