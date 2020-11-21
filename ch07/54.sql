WITH hurricane_detail AS (
SELECT sid, season, number, basin, name,
  ARRAY_AGG(
    STRUCT(
      iso_time,
      nature,
      usa_sshs,
      STRUCT(usa_latitude AS latitude, usa_longitude AS longitude, usa_wind AS wind, usa_pressure AS pressure) AS usa,
      STRUCT(tokyo_latitude AS latitude, tokyo_longitude AS longitude, tokyo_wind AS wind, tokyo_pressure AS pressure) AS tokyo
    ) ORDER BY iso_time ASC ) AS obs
FROM 'bigquery-public-data'.noaa_hurricanes.hurricanes
GROUP BY sid, season, number, basin, name
)

SELECT
  COUNT(sid) AS count_of_storms,
  season
FROM hurricane_detail
GROUP BY season
ORDER BY season DESC