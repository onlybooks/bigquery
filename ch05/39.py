table_id = 'bigquery-public-data.london_bicycles.cycle_stations'
table = bq.get_table(table_id)
rows = bq.list_rows(table,
                    start_index=0,
                    max_results=5)
