rows = [
    (1, u'What is BigQuery?'),
    (2, u'Query essentials'),
]
print(table.table_id, table.num_rows)
errors = bq.insert_rows(table, rows)
print(errors)
table = bq.get_table(table_id)
print(table.table_id, table.num_rows)  # DELAYED
