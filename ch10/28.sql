CREATE TEMPORARY FUNCTION
  decrypt(keyset BYTES, encrypted BYTES, trip_start TIMESTAMP) AS (
    AEAD.DECRYPT_STRING(keyset, encrypted, CAST(trip_start AS STRING))
);

WITH duration_by_station AS (
  SELECT
    duration
    , decrypt(keyset, start_station_name, start_date) AS start_station_name
  FROM
    ch10eu.encrypted_cycle_hire
  JOIN
    ch10eu.encrypted_bike_keys USING (bike_id)
)

SELECT
  start_station_name
  , AVG(duration) AS duration
FROM
  duration_by_station
GROUP BY
  start_station_name
ORDER BY duration DESC
LIMIT 5