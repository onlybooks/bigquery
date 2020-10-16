SELECT
  input, min, max, mean, stddev
FROM
  ml.FEATURE_INFO(MODEL dataset.model) AS model