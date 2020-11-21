config = bigquery.QueryJobConfig()
config.query_parameters = [
    bigquery.ScalarQueryParameter('min_duration', "INT64", 600)
]
job = bq.query(query2, location='EU', job_config=config)
