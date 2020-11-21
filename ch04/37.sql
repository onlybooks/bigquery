CREATE TEMP FUNCTION cleanup_numeric(x STRING) AS
(
  IF ( x != 'NULL' AND x != 'PrivacySuppressed',
    CAST(x as FLOAT64),
    NULL )
);

WITH etl_data AS (
  SELECT
    INSTNM
    , cleanup_numeric(ADM_RATE_ALL) AS ADM_RATE_ALL
    , cleanup_numeric(FIRST_GEN) AS FIRST_GEN
    , cleanup_numeric(MD_FAMINC) AS MD_FAMINC
    , cleanup_numeric(SAT_AVG) AS SAT_AVG
    , cleanup_numeric(MD_EARN_WNE_P10) AS MD_EARN_WNE_P10
  FROM
    `ch04.college_scorecard_gcs`
)

SELECT
  *
FROM
  etl_data
WHERE
  SAT_AVG > 1300
  AND ADM_RATE_ALL < 0.2
  AND FIRST_GEN > 0.1
ORDER BY
  MD_FAMINC ASC
LIMIT 10