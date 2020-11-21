bq mkdef --source_format=NEWLINE_DELIMITED_JSON --autodetect \
  -- hive_partitioning_mode=STRINGS <gcs_uri> <schema> > table_def.json