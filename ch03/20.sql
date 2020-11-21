WITH example AS (
  SELECT 'armin@abc.com' AS email, 'Annapolis,, MD' AS city
  UNION ALL SELECT 'boyan@bca.com', 'Boulder, CA'
  UNION ALL SELECT 'carrie@cab.com', 'Chicago, IL'
)

SELECT 
  CONCAT(
     SUBSTR(email, 1, STRPOS(email, '@') - 1), -- username
     ' from ', city) AS callers
FROM example