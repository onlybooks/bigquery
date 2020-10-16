WITH days AS (
  SELECT
    GENERATE_DATE_ARRAY('2019-06-23', '2019-08-22', INTERVAL 10 DAY) AS summer,
    ['Lak', 'Jordan', 'Graham'] AS minions
)

SELECT
  summer[ORDINAL(dayno)] AS summer_day
  , minions[OFFSET(MOD(dayno, ARRAY_LENGTH(minions)))] AS minion
FROM
  days, UNNEST(GENERATE_ARRAY(1,ARRAY_LENGTH(summer),1)) dayno
ORDER BY summer_day ASC