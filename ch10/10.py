from google.cloud import bigquery
def query_to_gcs():
    client = bigquery.Client()
    # 쿼리를 실행하고 완료될 때까지 기다린다
    query_job = client.query("""
        ...
        """)
    query_job.result()

    # GCS로 내보내기 작업을 실행하고 완료될 때까지 기다린다
    extract_job = client.extract_table(query_job.destination, "gs://bucket/file.csv")
    extract_job.result()
