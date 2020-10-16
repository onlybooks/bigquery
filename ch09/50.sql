CREATE OR REPLACE TABLE ch09eu.movielens_users AS
SELECT
  userId
  , RAND() * COUNT(rating) AS loyalty
  , CONCAT(SUBSTR(CAST(userId AS STRING), 0, 2)) AS postcode
FROM
  ch09eu.movielens_ratings
GROUP BY userId