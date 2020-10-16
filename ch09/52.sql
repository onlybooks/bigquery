WITH productFeatures AS (
  SELECT
    p.* EXCEPT(genres)
    , g
    , (SELECT ARRAY_AGG(weight) FROM UNNEST(factor_weights)) AS product_factors
  FROM
    ch09eu.movielens_movies p, UNNEST(genres) g
  JOIN
    ML.WEIGHTS(MODEL ch09eu.movie_recommender_16) w
  ON
    processed_input = 'movieId' AND feature = CAST(p.movieId AS STRING)
  )

SELECT * FROM productFeatures
LIMIT 5