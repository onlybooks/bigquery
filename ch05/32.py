table_id = '{}.ch05.temp_table3'.format(PROJECT)
job = bq.load_table_from_dataframe(df, table_id)
job.result() # blocks and waits
print("Loaded {} rows into {}".format(job.output_rows, tblref.table_id))