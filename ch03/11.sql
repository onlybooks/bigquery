WITH catalog AS (
   SELECT 30.0 AS costPrice, 0.15 AS markup, 0.1 AS taxRate
   UNION ALL SELECT NULL, 0.21, 0.15
   UNION ALL SELECT 30.0, NULL, 0.09
   UNION ALL SELECT 30.0, 0.30, NULL
   UNION ALL SELECT 30.0, NULL, NULL
)
SELECT
  *, ROUND(
    costPrice * 
    IF(markup IS NULL, 1.05, 1+markup) * 
    IF(taxRate IS NULL, 1.10, 1+taxRate) 
    , 2) AS salesPrice
FROM catalog
