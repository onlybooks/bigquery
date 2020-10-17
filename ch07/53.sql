CREATE OR REPLACE TABLE ch07.zipcode_area AS
SELECT
  * REPLACE(ST_GeogFromText(zipcode_geom) AS zipcode_geom)
FROM
  `bigquery-public-data`.utility_us.zipcode_area