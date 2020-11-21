SELECT
  processed_input AS input,
  model.weight AS input_weight,
  category.category AS category_name,
  category.weight AS category_weight
FROM
  ML.WEIGHTS(MODEL dataset.model) AS model,
  UNNEST(category_weights) AS category