WITH stations AS (
  SELECT
    (SELECT location FROM ch08eu.cycle_stations WHERE id = 300) AS loc300,
    (SELECT location FROM ch08eu.cycle_stations WHERE id = 302) AS loc302,
    (SELECT location FROM ch08eu.cycle_stations WHERE id = 305) AS loc305
  )

SELECT
  ST_MakeLine(loc300, loc305) AS seg1
  , ST_MakePolygon(ST_MakeLine([loc300, loc305, loc302])) AS poly
FROM
  stations