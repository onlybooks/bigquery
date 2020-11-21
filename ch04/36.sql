WITH etl_data AS (
  SELECT
    SAFE_CAST(SAT_AVG AS FLOAT64) AS SAT_AVG
  FROM
    `ch04.college_scorecard_gcs`
)
SELECT
  MAX(SAT_AVG) AS MAX_SAT_AVG
FROM
  etl_data