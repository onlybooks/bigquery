CREATE OR REPLACE TABLE ch10eu.encrypted_bike_keys AS
WITH bikes AS (
  SELECT
    DISTINCT bike_id
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
)
SELECT
  bike_id, KEYS.NEW_KEYSET('AEAD_AES_GCM_256') AS keyset
FROM
  bikes