query = """
    SELECT
        AVG(duration) as avg_duration
    FROM
        `bigquery-public-data`.london_bicycles.cycle_hire
    WHERE
        start_date BETWEEN @START_TIME AND @END_TIME
"""
query_params = [
    bigquery.ScalarQueryParameter(
        "START_TIME", "TIMESTAMP", start_time),
    bigquery.ScalarQueryParameter(
        "END_TIME", "TIMESTAMP", end_time),
]
job_config = bigquery.QueryJobConfig()
job_config.query_parameters = query_params
query_job = client.query(
    query,
    location="EU",
    job_config=job_config,
)
for row in query_job:
    print(row.avg_duration)
print("______________________")
