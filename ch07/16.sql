WITH stations AS (
  SELECT
    s.id AS start_id
    , e.id AS end_id
    , ST_Distance(ST_GeogPoint(s.longitude, s.latitude),
                  ST_GeogPoint(e.longitude, e.latitude)) AS distance
  FROM
    `bigquery-public-data`.london_bicycles.cycle_stations s,
    `bigquery-public-data`.london_bicycles.cycle_stations e
),

trip_distance AS (
  SELECT
    bike_id
    , distance
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire,
    stations
  WHERE
    start_station_id = start_id
    AND end_station_id = end_id
)

SELECT
  bike_id
  , SUM(distance)/1000 AS total_distance
FROM trip_distance
GROUP BY bike_id
ORDER BY total_distance DESC
LIMIT 5