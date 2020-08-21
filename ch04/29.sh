bq load --source_format=ORC --autodetect \
  --hive_partitioning_mode=AUTO <dataset>.<table> <gcs_uri>