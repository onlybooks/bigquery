with gzip.open('../04_load/college_scorecard.csv.gz') as fp:
    job = bq.load_table_from_file(fp, tblref, job_config=job_config)
