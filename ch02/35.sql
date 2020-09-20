WITH from_item_a AS (
  SELECT 'Dalles' as city, 'OR' as state
  UNION ALL SELECT 'Tokyo', 'Tokyo'
  UNION ALL SELECT 'Mumbai', 'Maharashtra'
),

from_item_b AS (
  SELECT 'OR' as state, 'USA' as country
  UNION ALL SELECT 'Tokyo', 'Japan'
  UNION ALL SELECT 'Maharashtra', 'India'
)

SELECT from_item_a.*, country AS surcharge
FROM from_item_a
JOIN from_item_b
ON from_item_a.state != from_item_b.state