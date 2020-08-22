%%bigquery docks --project $PROJECT
SELECT
  docks_count, latitude, longitude
FROM `bigquery-public-data`.london_bicycles.cycle_stations
WHERE bikes_count > 0
