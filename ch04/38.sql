CREATE TEMP FUNCTION cleanup_numeric(x STRING) AS
(
  IF ( x != 'NULL' AND x != 'PrivacySuppressed',
    CAST(x as FLOAT64),
    NULL )
);

CREATE TABLE ch04.college_scorecard_etl
OPTIONS(description="대학 점수카드 데이터를 정리한 데이터") AS

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

SELECT * FROM etl_data