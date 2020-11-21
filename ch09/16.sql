SELECT
  processed_input AS input,
  model.weight AS input_weight
FROM
  ML.WEIGHTS(MODEL dataset.model) AS model