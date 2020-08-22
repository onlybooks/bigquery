billing <- 'cloud-training-demos' # your project name
sql <- "
SELECT
  start_station_name
  , AVG(duration) as duration
  , COUNT(duration) as num_trips
FROM `bigquery-public-data`.london_bicycles.cycle_hire
GROUP BY start_station_name
ORDER BY num_trips DESC
LIMIT 5
"
tbl <- bq_project_query(billing, sql)
bq_table_download(tbl, max_results=100)
grid.tbl(tbl)