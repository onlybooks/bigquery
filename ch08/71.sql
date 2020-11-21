BEGIN
  DECLARE stations ARRAY<STRING>;
  SET stations = (
    SELECT
      ARRAY_AGG(name) names
    FROM
      `bigquery-public-data`.london_bicycles.cycle_stations
    WHERE
      name LIKE '%Kings%'
  );
  IF ARRAY_LENGTH(stations) = 0 THEN
    RAISE USING MESSAGE = "No stations matched";
  END IF;
EXCEPTION WHEN ERROR THEN
  SELECT
    @@error.message,
    @@error.stack_trace;
END;