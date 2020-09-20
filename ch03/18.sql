WITH example AS (
  SELECT true AS is_vowel, 'a' as letter, 1 as position
  UNION ALL SELECT false, 'b', 2
  UNION ALL SELECT false, 'c', 3
)
SELECT COUNTIF(is_vowel) as num_vowels from example