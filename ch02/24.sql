SELECT
  gender
  , EXTRACT(YEAR from starttime) AS year
  , COUNT(*) AS numtrips
FROM
`bigquery-public-data`.new_york_citibike.citibike_trips
WHERE gender != 'unknown' and starttime IS NOT NULL
GROUP BY gender, year
HAVING year > 2016