bq load --source_format=AVRO \
    --time_partitioning_expiration … \
    --time_partitioning_field … \
    --time_partitioning_type … \
    --clustering_fields … \
    --schema … \
    todataset.table_name \
    gs://.../data_*.avro