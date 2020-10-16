SELECT
  name
  , ST_AsGeoJSON(location) AS location_string
FROM
  ch08eu.cycle_stations
WHERE
  id BETWEEN 300 and 305