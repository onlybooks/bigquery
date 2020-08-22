table = bq.get_table( "bigquery-public-data.london_bicycles.cycle_stations")
print('{} rows in {}'.format(table.num_rows, table.table_id))