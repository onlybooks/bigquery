schema = [
    bigquery.SchemaField("chapter", "INTEGER", mode="REQUIRED"),
    bigquery.SchemaField("title", "STRING", mode="REQUIRED"),
]
table_id = '{}.ch05.temp_table2'.format(PROJECT)
table = bigquery.Table(table_id, schema)
table = bq.create_table(table, exists_ok=True)
print('{} created on {}'.format(table.table_id, table.created))
print(table.schema)
