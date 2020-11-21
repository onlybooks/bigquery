WITH denormalized_table AS (
  SELECT
    start_station_name
    , end_station_name
    , ST_DISTANCE(ST_GeogPoint(s1.longitude, s1.latitude),
                  ST_GeogPoint(s2.longitude, s2.latitude)) AS distance
    , duration
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire AS h
  JOIN
    `bigquery-public-data`.london_bicycles.cycle_stations AS s1
  ON h.start_station_id = s1.id
    JOIN
      `bigquery-public-data`.london_bicycles.cycle_stations AS s2
  ON h.end_station_id = s2.id
),

durations AS (
  SELECT
    start_station_name
    , end_station_name
    , MIN(distance) AS distance
    , AVG(duration) AS duration
    , COUNT(*) AS num_rides
  FROM
    denormalized_table
  WHERE
    duration > 0 AND distance > 0
  GROUP BY start_station_name, end_station_name
  HAVING num_rides > 100
)

SELECT
  start_station_name
  , end_station_name
  , distance
  , duration
  , duration/distance AS pace
FROM durations
ORDER BY pace ASC
LIMIT 5