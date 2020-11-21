SELECT * FROM UNNEST(
  [
    STRUCT('male' AS gender, [9306602, 3955871] AS numtrips)
    , STRUCT('female' AS gender, [3236735, 1260893] AS numtrips)
  ])
