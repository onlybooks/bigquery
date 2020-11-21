query_params = [
            bigquery.ScalarQueryParameter(
                    "STATION", "STRING", station_name),
            bigquery.ScalarQueryParameter(
                    "MIN_DURATION", "FLOAT64", min_duration),
            bigquery.ScalarQueryParameter(
                    "MAX_DURATION", "FLOAT64", max_duration),
]

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
