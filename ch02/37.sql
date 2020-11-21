WITH winners AS (
  SELECT 'John' AS person, '100m' AS event
  UNION ALL SELECT 'Hiroshi', '200m'
  UNION ALL SELECT 'Sita', '400m'
),
gifts AS (
  SELECT 'Google Home' AS gift
  UNION ALL SELECT 'Google Hub'
  UNION ALL SELECT 'Pixel3'
)
SELECT person, gift
FROM winners
CROSS JOIN gifts