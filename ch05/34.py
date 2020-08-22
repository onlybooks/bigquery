job_config = bigquery.LoadJobConfig()
job_config.autodetect = True
job_config.source_format = bigquery.SourceFormat.CSV
job_config.null_marker = 'NULL'
uri = "gs://bigquery-oreilly-book/college_scorecard.csv"
table_id = '{}.ch05.college_scorecard_gcs'.format(PROJECT)
job = bq.load_table_from_uri(uri, table_id, job_config=job_config)