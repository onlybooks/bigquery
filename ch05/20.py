tables = bq.list_tables("bigquery-public-data.london_bicycles")
for table in tables:
    print(table.table_id)
