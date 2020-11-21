stations_to_examine = pd.concat(stations_to_examine)
bq = bigquery.Client(project=PROJECT)
tblref = TableReference.from_string(
                  '{}.ch05eu.bad_bikes'.format(PROJECT))
job = bq.load_table_from_dataframe(stations_to_examine, tblref)
job.result() # 중단 후 대기