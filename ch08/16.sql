CREATE OR REPLACE FUNCTION fhoffa.x.median (arr ANY TYPE) AS ((
  SELECT IF (MOD(ARRAY_LENGTH(arr), 2) = 0,
    ( arr[OFFSET(DIV(ARRAY_LENGTH(arr), 2) - 1)] +
    arr[OFFSET(DIV(ARRAY_LENGTH(arr), 2))] ) / 2,
    arr[OFFSET(DIV(ARRAY_LENGTH(arr), 2))]
  )
  FROM (SELECT ARRAY_AGG(x ORDER BY x) AS arr FROM UNNEST(arr) AS x)
));