from google.cloud import bigquery
def query_to_gcs():
  client = bigquery.Client()
  # Run query and wait for it to complete
  query_job = client.query("""
    ...
  """)
  query_job.result()
  # Extract to GCS, and wait for it to complete
  extract_job = client.extract_table(query_job.destination, "gs://bucket/file.csv")
  extract_job.result()