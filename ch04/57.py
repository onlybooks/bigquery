# create an array of tuples and insert as data becomes available
rows_to_insert = [
    (u'U. Puerto Rico', 0.18, 0.46, 23000, 1134, 32000),
    (u'Guam U.', 0.43, 0.21, 28000, 1234, 33000)
]
errors = client.insert_rows(table, rows_to_insert)  # API request
