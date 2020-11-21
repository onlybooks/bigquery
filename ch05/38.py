source_tbl = 'bigquery-public-data.london_bicycles.cycle_stations'
dest_uri = 'gs://{}/tmp/exported/cycle_stations'.format(BUCKET)
config = bigquery.job.ExtractJobConfig(
    destination_format=bigquery.job.DestinationFormat.NEWLINE_DELIMITED_JSON)
job = bq.extract_table(source_tbl, dest_uri,
                       location='EU',job_config=config)
job.result() # 중단 및 대기
