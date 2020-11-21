WITH userFeatures AS (
  SELECT
    u.*,
    (SELECT ARRAY_AGG(weight) FROM UNNEST(factor_weights)) AS user_factors
  FROM
    ch09eu.movielens_users u
  JOIN
    ML.WEIGHTS(MODEL ch09eu.movie_recommender_16) w
  ON
    processed_input = 'userId' AND feature = CAST(u.userId AS STRING)
)

SELECT * FROM userFeatures
LIMIT 5