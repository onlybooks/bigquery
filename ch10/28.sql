CREATE TEMPORARY FUNCTION encrypt_int(keyset BYTES, data INT64, trip_start TIMESTAMP) AS (
  AEAD.ENCRYPT(keyset, CAST(data AS STRING), CAST(trip_start AS STRING))
);
CREATE TEMPORARY FUNCTION encrypt_str(keyset BYTES, data STRING, trip_start TIMESTAMP) AS (
  AEAD.ENCRYPT(keyset, data, CAST(trip_start AS STRING))
);
