page_size = 10000
row_iter = bq.list_rows(table,
page_size=page_size)
for page in row_iter.pages:
  rows = list(page)
# do something with rows ... print(len(rows))