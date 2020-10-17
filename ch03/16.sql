WITH example AS (
  SELECT true AS is_vowel, 'a' AS letter, 1 AS position
  UNION ALL SELECT false, 'b', 2
  UNION ALL SELECT false, 'c', 3
)
SELECT SUM(CAST(is_vowel AS INT64)) as num_vowels FROM example