source_tbl = 'bigquery-public-data.london_bicycles.cycle_stations'
dest_tbl = '{}.ch05eu.cycle_stations_copy'.format(PROJECT)
job = bq.copy_table(source_tbl, dest_tbl, location='EU')
job.result() # blocks and waits
dest_table = bq.get_table(dest_tbl)
print(dest_table.num_rows)