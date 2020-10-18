SELECT
  name
  , ST_GeogPoint(longitude, latitude) AS location
FROM
  `bigquery-public-data`.london_bicycles.cycle_stations
WHERE
  id BETWEEN 300 AND 305