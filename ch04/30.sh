bq load --source_format=ORC --autodetect \
  --hive_partitioning_mode=STRINGS <dataset>.<table> <gcs_uri>