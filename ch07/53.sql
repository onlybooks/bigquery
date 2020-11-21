CREATE OR REPLACE TABLE ch07.hurricanes_nested_track AS (

SELECT sid, season, number, basin, name,
 ARRAY_AGG(
   STRUCT(
       iso_time,
       nature,
       usa_sshs,
       STRUCT(usa_latitude AS latitude, usa_longitude AS longitude, usa_wind AS wind, usa_pressure AS pressure) AS usa,
       STRUCT(tokyo_latitude AS latitude, tokyo_longitude AS longitude, tokyo_wind AS wind, tokyo_pressure AS pressure) AS tokyo,
       STRUCT(cma_latitude AS latitude, cma_longitude AS longitude, cma_wind AS wind, cma_pressure AS pressure) AS cma,
       STRUCT(hko_latitude AS latitude, hko_longitude AS longitude, hko_wind AS wind, hko_pressure AS pressure) AS hko,
       STRUCT(newdelhi_latitude AS latitude, newdelhi_longitude AS longitude, newdelhi_wind AS wind, newdelhi_pressure AS pressure) AS newdelhi,
       STRUCT(reunion_latitude AS latitude, reunion_longitude AS longitude, reunion_wind AS wind, reunion_pressure AS pressure) AS reunion,
       STRUCT(bom_latitude AS latitude, bom_longitude AS longitude, bom_wind AS wind, bom_pressure AS pressure) AS bom,
       STRUCT(wellington_latitude AS latitude, wellington_longitude AS longitude, wellington_wind AS wind, wellington_pressure AS pressure) AS wellington,
       STRUCT(nadi_latitude AS latitude, nadi_longitude AS longitude, nadi_wind AS wind, nadi_pressure AS pressure) AS nadi
   ) ORDER BY iso_time ASC ) AS obs
FROM `bigquery-public-data`.noaa_hurricanes.hurricanes
GROUP BY sid, season, number, basin, name

)


SELECT
  number, name, basin,
  (SELECT AS STRUCT iso_time, usa.latitude, usa.longitude, usa.wind FROM UNNEST(obs) ORDER BY usa.wind DESC LIMIT 1).*
FROM ch07.hurricanes_nested_track
WHERE season = '2018'
ORDER BY number ASC