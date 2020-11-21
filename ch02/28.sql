SELECT 
  ARRAY_LENGTH(bikerides) AS num_items
  , bikerides[ OFFSET(0) ].gender AS first_gender
FROM
(SELECT 
  [
    STRUCT('male' AS gender, [9306602, 3955871] AS numtrips)
    , STRUCT('female' AS gender, [3236735, 1260893] AS numtrips)
  ] AS bikerides)