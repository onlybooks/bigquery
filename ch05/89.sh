bq query \
  --use_legacy_sql=false \
  'SELECT MAX(duration) FROM \
  `bigquery-public-data`.london_bicycles.cycle_hire'