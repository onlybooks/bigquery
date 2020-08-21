CREATE OR REPLACE TABLE ch04.college_scorecard_etl AS
SELECT
  INSTNM
  , ADM_RATE_ALL
  , FIRST_GEN
  , MD_FAMINC
  , SAT_AVG
  , MD_EARN_WNE_P10
FROM ch04.college_scorecard