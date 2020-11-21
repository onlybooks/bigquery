SELECT
  CAST(EXTRACT(date FROM start_date) AS TIMESTAMP) AS date
  , COUNT(*) AS numrentals
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
WHERE start_station_name LIKE '%Hyde%' -- 하이드 공원의 모든 대여소
GROUP BY date
HAVING date BETWEEN '2015-05-01' AND '2015-06-15'
ORDER BY date