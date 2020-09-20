SELECT
  APPROX_COUNT_DISTINCT(start_station_name) AS distinct_start
  , APPROX_COUNT_DISTINCT(end_station_name) AS distinct_end
  , APPROX_COUNT_DISTINCT(both_stations) AS distinct_station
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
  , UNNEST([start_station_name, end_station_name]) AS both_stations