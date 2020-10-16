CREATE TEMPORARY FUNCTION stationName(stationId INT64) AS(
  (SELECT name FROM
    `bigquery-public-data`.london_bicycles.cycle_stations
    WHERE id = stationId)
  );