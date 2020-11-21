CREATE OR REPLACE TABLE -- 또는 TABLE/MODEL/FUNCTION
ch10eu.stations_under_construction
(
  station_id INT64 OPTIONS(description = 'Station ID'),
  name string OPTIONS(description = 'Official station name')
)
OPTIONS(
  description = 'Stations in London.',
  labels=[("pii", "none")] -- 반드시 소문자여야 한다.
)
AS

WITH stations AS (
  SELECT [300, 314, 287] AS closed
)

SELECT
  station_id
  , (SELECT name FROM `bigquery-public-data`.london_bicycles.cycle_stations WHERE id=station_id) AS name
FROM
  stations, UNNEST(closed) AS station_id