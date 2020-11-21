BEGIN
  DECLARE stations ARRAY<INT64>;
SET stations = (
  SELECT
    ARRAY_AGG(CAST(name AS INT64)) names
  FROM
    `bigquery-public-data`.london_bicycles.cycle_stations
  WHERE
    name LIKE '%Kings%'
  );
EXCEPTION WHEN ERROR THEN
  SELECT
    @@error.message,
    @@error.stack-trace;
END;