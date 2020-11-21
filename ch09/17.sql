SELECT
  input, min, max, mean, stddev
FROM
  ML.FEATURE_INFO(MODEL dataset.model) AS model