WITH example AS (
  SELECT NULL AS is_vowel, NULL AS letter, -1 AS position
  UNION ALL SELECT true, 'a', 1
  UNION ALL SELECT false, 'b', 2
  UNION ALL SELECT false, 'c', 3
)
SELECT * FROM example WHERE is_vowel != false