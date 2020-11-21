WITH male_babies AS (
SELECT
  name
  , number AS num_babies
FROM `bigquery-public-data`.usa_names.usa_1910_current
WHERE gender = 'M'
),
female_babies AS (
SELECT
  name
  , number AS num_babies
FROM `bigquery-public-data`.usa_names.usa_1910_current
WHERE gender = 'F'
),
both_genders AS (
SELECT
  name
  , SUM(m.num_babies) + SUM(f.num_babies) AS num_babies
  , SUM(m.num_babies) / (SUM(m.num_babies) + SUM(f.num_babies)) AS frac_male
FROM male_babies AS m
JOIN female_babies AS f
USING (name)
GROUP BY name
)

SELECT * FROM both_genders
WHERE frac_male BETWEEN 0.3 AND 0.7
ORDER BY num_babies DESC
LIMIT 5