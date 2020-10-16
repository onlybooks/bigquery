job_config = bigquery.QueryJobConfig()
job_config.query_parameters = query_params
query_job = client.query(
  query,
  location="EU",
  job_config=job_config,
)
for row in query_job:
  print("{}: \t{}".format(
    row.start_station_name, row.avg_duration))
