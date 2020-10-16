SELECT * FROM
ML.PREDICT(MODEL ch09eu.movie_recommender_16, (
  WITH allUsers AS (
    SELECT DISTINCT userId
    FROM ch09eu.movielens_ratings
)
  SELECT
    96481 AS movieId,
    (SELECT title FROM ch09eu.movielens_movies WHERE movieId=96481) title,
    userId
  FROM
    allUsers
  ))
ORDER BY predicted_rating DESC
LIMIT 100