WITH example AS (
  SELECT true AS is_vowel, 'a' AS letter, 1 AS position
  UNION ALL SELECT false, 'b', 2
  UNION ALL SELECT false, 'c', 3
)
SELECT SUM(IF(is_vowel, 1, 0)) AS num_vowels FROM example