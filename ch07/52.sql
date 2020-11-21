SELECT
  sid, number, basin, name,
  ARRAY_AGG(STRUCT(iso_time, usa_latitude, usa_longitude, usa_wind) ORDER BY
  usa_wind DESC LIMIT 1)[OFFSET(0)].*
FROM
  `bigquery-public-data`.noaa_hurricanes.hurricanes
WHERE
  season = '2018'
GROUP BY
    sid, number, basin, name
ORDER BY number ASC