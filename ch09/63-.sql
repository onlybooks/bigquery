CREATE OR REPLACE MODEL ch09eu.movielens_recommender_hybrid
OPTIONS(model_type='linear_reg', input_label_cols=['rating'])
AS

SELECT
  * EXCEPT(user_factors, product_factors)
  , ch09eu.arr_to_input_16_users(user_factors).*
  , ch09eu.arr_to_input_16_products(product_factors).*
FROM
  ch09eu.movielens_hybrid_dataset