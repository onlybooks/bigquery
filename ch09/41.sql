CREATE OR REPLACE TABLE ch09eu.movielens_movies AS
SELECT
  * REPLACE(SPLIT(genres, "|") AS genres)
FROM
  ch09eu.movielens_movies_raw