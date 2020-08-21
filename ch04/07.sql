ALTER TABLE ch04.college_scorecard
SET OPTIONS (
  expiration_timestamp = TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 7 DAY),
  description="College Scorecard table that expires seven days from now"
)