WITH distances AS (
  SELECT
    id
    , ST_Distance(location, ST_GeogPoint(-0.12574, 51.50853)) AS distance
  FROM
    ch08eu.cycle_stations
),
durations AS (
  SELECT
    start_station_id AS id
    , APPROX_QUANTILES(duration, 2)[OFFSET(1)] AS median_duration
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  GROUP BY start_station_id
)

SELECT CORR(distance, median_duration) AS pearson
FROM distances
JOIN durations
USING(id)