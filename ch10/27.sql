CREATE OR REPLACE TABLE ch10eu.encrypted_cycle_hire AS

SELECT
  cycle_hire.* EXCEPT(start_station_id, end_station_id,
    start_station_name, end_station_name)
  , encrypt_int(keyset, start_station_id, start_date) AS start_station_id
  , encrypt_int(keyset, end_station_id, start_date) AS end_station_id
  , encrypt_str(keyset, start_station_name, start_date) AS start_station_name
  , encrypt_str(keyset, end_station_name, start_date) AS end_station_name
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
JOIN
  ch10eu.encrypted_bike_keys
USING (bike_id)