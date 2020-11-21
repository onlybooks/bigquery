rows = [
    ('3', u'Operating on data types'),
    ('wont work', u'This will fail'),
    ('4', u'Loading data into BigQuery'),
]
errors = bq.insert_rows(table, rows)
print(errors)
