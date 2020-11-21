WITH winners AS (
  SELECT 'John' AS person, '100m' AS event
  UNION ALL SELECT 'Hiroshi', '200m'
  UNION ALL SELECT 'Sita', '400m'
  UNION ALL SELECT 'Kwame', '50m'
),
gifts AS (
  SELECT 'Google Home' AS gift, '100m' AS event
  UNION ALL SELECT 'Google Hub', '200m'
  UNION ALL SELECT 'Pixel3', '400m'
  UNION ALL SELECT 'Google Mini', '5000m'
)

SELECT person, gift
FROM winners
RIGHT OUTER JOIN gifts
ON winners.event = gifts.event