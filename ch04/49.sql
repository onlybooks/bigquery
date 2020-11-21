CREATE TABLE
  ch04.college_scorecard_valid_sat
  AS
  SELECT * FROM ch04.college_scorecard_gcs
  WHERE LENGTH(SAT_AVG) > 0