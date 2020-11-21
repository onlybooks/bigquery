config = bigquery.QueryJobConfig()
config.dry_run = True
job = bq.query(query, location='EU', job_config=config)
print("This query will process {} bytes."
      .format(job.total_bytes_processed))