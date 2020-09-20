SELECT 
  ARRAY_LENGTH(bikerides) as num_items
  , bikerides[ OFFSET(0) ].gender as first_gender
FROM
(SELECT 
  [
    STRUCT('male' as gender, [9306602, 3955871] as numtrips)
    , STRUCT('female' as gender, [3236735, 1260893] as numtrips)
  ] AS bikerides)