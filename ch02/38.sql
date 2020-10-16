WITH winners AS (
  SELECT 'John' as person, '100m' as event
  UNION ALL SELECT 'Hiroshi', '200m'
  UNION ALL SELECT 'Sita', '400m'
  UNION ALL SELECT 'Kwame', '50m'
),
gifts AS (
  SELECT 'Google Home' as gift, '100m' as event
  UNION ALL SELECT 'Google Hub', '200m'
  UNION ALL SELECT 'Pixel3', '400m'
  UNION ALL SELECT 'Google Mini', '5000m'
)

SELECT person, gift
FROM winners
INNER JOIN gifts
ON winners.event = gifts.event
