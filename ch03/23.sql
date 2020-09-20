SELECT
  CAST(42 AS STRING)
  , CAST('42' AS INT64)
  , FORMAT('%03d', 42)
  , FORMAT('%5.3f', 32.457842)
  , FORMAT('%5.3f', 32.4)
  , FORMAT('**%s**', 'H')
  , FORMAT('%s-%03d', 'Agent', 7)