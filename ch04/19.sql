ALTER TABLE ch04.college_scorecard
  SET OPTIONS (
    expiration_timestamp=TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 7 DAY),
    description="지금으로부터 7일뒤에 만료되는 college_scorecard 테이블"
  )