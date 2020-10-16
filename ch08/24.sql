WITH numtrips AS (
  SELECT
    bike_id AS id,
    COUNT(*) AS num_trips
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  GROUP BY
    bike_id
)

SELECT
  ARRAY_AGG(STRUCT(id,num_trips) ORDER BY num_trips DESC LIMIT 100) AS bike
FROM
  numtrips