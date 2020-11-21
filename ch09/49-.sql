-- 최종 모델이 아니다. movie_recommender_16을 보자
CREATE OR REPLACE MODEL ch09eu.movie_recommender
options(model_type='matrix_factorization',
        user_col='userId', item_col='movieId', rating_col='rating')
AS

SELECT
  userId, movieId, rating
FROM ch09eu.movielens_ratings