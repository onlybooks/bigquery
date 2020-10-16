SELECT
  processed_input
  , feature
  , TO_JSON_STRING(factor_weights)
  , intercept
FROM ML.WEIGHTS(MODEL ch09eu.movie_recommender_16)
WHERE
  (processed_input = 'movieId' AND feature = '96481')
  OR
  (processed_input = 'userId' AND feature = '54192')