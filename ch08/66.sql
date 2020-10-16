SET stations = (
  SELECT
    ARRAY_AGG(name)
  FROM
    `bigquery-public-data`.london_bicycles.cycle_stations
  WHERE
    name LIKE PATTERN
);