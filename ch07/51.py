%%bigquery df --use_bqstorage_api --project $PROJECT
SELECT
  start_station_name
  , end_station_name
  , start_date
  , duration
FROM `bigquery-public-data`.london_bicycles.cycle_hire