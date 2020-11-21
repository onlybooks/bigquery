while not job.done():
    print('.', end='', flush=True)
    time.sleep(0.1)
print('Done')
table = bq.get_table(tblref)
print("Loaded {} rows into {}.".format(table.num_rows, table.table_id))
