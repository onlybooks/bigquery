from airflow import DAG
from datetime import datetime, timedelta
from airflow.contrib.operators.gcs_to_bq import GoogleCloudStorageToBigQueryOperator
from airflow.contrib.operators.bigquery_operator import BigQueryOperator

PROJECT_ID='bigquery-definitive' # 여러분들의 프로젝트 ID를 넣어주세요
BUCKET_NAME = 'bigquery-definitive' # 생성한 버킷 이름을 넣어주세요

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2019, 11, 25),
    'end_date': datetime(2019, 11, 29),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
    'project_id': PROJECT_ID
}

dag = DAG('simple_elt_storage_to_bigquery',
          default_args=default_args,
          schedule_interval='30 0 * * *')

execution_date = '{{ ds_nodash }}'

storage_to_bigquery_task = GoogleCloudStorageToBigQueryOperator(
    dag=dag,
    google_cloud_storage_conn_id='google_cloud_default',
    bigquery_conn_id='google_cloud_default',
    task_id='storage_to_bigquery',
    bucket=BUCKET_NAME,
    schema_object='data/bike_schema.json',
    source_objects=[f"data/bike_data_{execution_date}.csv"],
    source_format='CSV',
    destination_project_dataset_table=f'{PROJECT_ID}.temp.bike_{execution_date}', 
    write_disposition='WRITE_TRUNCATE',
    skip_leading_rows=1
)

agg_query = f"""
SELECT 
  start_date, start_station_id, end_station_id, COUNT(bikeid) as cnt
FROM `{PROJECT_ID}.temp.bike_{execution_date}`
GROUP BY start_date, start_station_id, end_station_id
"""

query_task = BigQueryOperator(
        dag=dag,
        task_id="query_to_table",
        bigquery_conn_id='google_cloud_default',
        sql=agg_query,
        use_legacy_sql=False,
        write_disposition='WRITE_TRUNCATE',
        destination_dataset_table=f"temp.bike_agg_{execution_date}"
)

storage_to_bigquery_task >> query_task

