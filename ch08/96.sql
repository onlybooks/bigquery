WITH identifier AS (
  SELECT
    CONCAT(
      CAST(bike_id AS STRING), '***',
      CAST(start_date AS STRING), '***',
      CAST(start_station_id AS STRING)) AS rowid
  FROM `bigquery-public-data.london_bicycles.cycle_hire`
  LIMIT 10
)

SELECT
  rowid, FARM_FINGERPRINT(rowid) AS fingerprint
FROM identifier