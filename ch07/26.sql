WITH all_babies AS (
SELECT
  name
  , SUM(IF(gender = 'M', number, 0)) AS male_babies
  , SUM(IF(gender = 'F', number, 0)) AS female_babies
FROM `bigquery-public-data.usa_names.usa_1910_current`
GROUP BY name
),

both_genders AS (
SELECT
  name
  , (male_babies + female_babies) AS num_babies
  , SAFE_DIVIDE(male_babies, male_babies + female_babies) AS frac_male
FROM all_babies
WHERE male_babies > 0 AND female_babies > 0
)

SELECT * FROM both_genders
WHERE frac_male BETWEEN 0.3 and 0.7
ORDER BY num_babies DESC
limit 5