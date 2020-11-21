from google.cloud import bigquery
client = bigquery.Client()
sql = """
WITH stations AS (
   SELECT [300, 314, 287] AS closed
)
SELECT
  station_id
  , (SELECT name FROM `bigquery-public-data`.london_bicycles.cycle_stations WHERE
id=station_id) AS name
FROM
  stations, UNNEST(closed) AS station_id """
job_config = bigquery.QueryJobConfig()
job_config.destination = (
  client.dataset('ch10eu').table('stations_under_construction'))
query_job = client.query(sql, location='EU', job_config=job_config)
query_job.result() # 쿼리가 완료될 때까지 대기한다