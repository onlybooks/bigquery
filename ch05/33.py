from google.cloud.bigquery.job import LoadJobConfig, WriteDisposition, CreateDisposition
load_config = LoadJobConfig(
    create_disposition=CreateDisposition.CREATE_IF_NEEDED,
    write_disposition=WriteDisposition.WRITE_TRUNCATE)
job = bq.load_table_from_dataframe(df, table_id, job_config=load_config)
