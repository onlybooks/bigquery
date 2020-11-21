bq show --schema dataset.table. # schema.json
bq --format=json show dataset.table. # tabledef.json
bq extract --destination_format=AVRO \
           dataset.table gs://.../data_*.avro # AVRO 파일