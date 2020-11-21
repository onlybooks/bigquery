WITH distances AS (
  SELECT
    a.id AS start_station_id
    , a.name AS start_station_name
    , b.id AS end_station_id
    , b.name AS end_station_name
    , ST_DISTANCE(ST_GeogPoint(a.longitude, a.latitude),
                  ST_GeogPoint(b.longitude, b.latitude)) AS distance
  FROM
    `bigquery-public-data`.london_bicycles.cycle_stations a
  CROSS JOIN
    `bigquery-public-data`.london_bicycles.cycle_stations b
  WHERE a.id != b.id
),

durations AS (
  SELECT
    start_station_id
    , end_station_id
    , AVG(duration) AS duration
    , COUNT(*) AS num_rides
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE
    duration > 0
  GROUP BY start_station_id, end_station_id
  HAVING num_rides > 100
)

SELECT
  start_station_name
  , end_station_name
  , distance
  , duration
  , duration/distance AS pace
FROM distances
JOIN durations
USING (start_station_id, end_station_id)
ORDER BY pace ASC
LIMIT 5