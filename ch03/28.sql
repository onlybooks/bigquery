SELECT
  fmt, input, zone
  , PARSE_TIMESTAMP(fmt, input, zone) AS ts
FROM (
  SELECT '%Y%m%d-%H%M%S' AS fmt, '20181118-220800' AS input, '+0' AS zone
  UNION ALL SELECT '%c', 'Sat Nov 24 21:26:00 2018', 'America/Los_Angeles'
  UNION ALL SELECT '%x %X', '11/18/18 22:08:00', 'UTC'
)