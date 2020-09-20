with all_names AS (
  SELECT name, gender, SUM(number) AS num_babies
  FROM `bigquery-public-data`.usa_names.usa_1910_current
  GROUP BY name, gender
),

male_names AS (
  SELECT name, num_babies
  FROM all_names
  WHERE gender = 'M'
),

female_names AS (
  SELECT name, num_babies
  FROM all_names
  WHERE gender = 'F'
),

ratio AS (
  SELECT
    name
    , (f.num_babies + m.num_babies) AS num_babies
    , m.num_babies / (f.num_babies + m.num_babies) AS frac_male
  FROM male_names AS m
  JOIN female_names AS f
  USING (name)
)

SELECT * from ratio
WHERE frac_male BETWEEN 0.3 and 0.7
ORDER BY num_babies DESC
LIMIT 5