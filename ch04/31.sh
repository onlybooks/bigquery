bq mkdef --source_format=ORC --autodetect \
  --hive_partitioning_mode=AUTO <gcs_uri> > table_def.json