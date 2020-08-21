bq mkdef --source_format=PARQUET gs://bucket/dir/files* > table_def.json
bq mk --external_table_definition=table_def.json <dataset>.<table>
