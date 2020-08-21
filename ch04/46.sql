SELECT INSTNM, COUNT(display_name) AS numusers
FROM `bigquery-public-data`.stackoverflow.users, ch04.college_scorecard_gs
WHERE REGEXP_CONTAINS(about_me, INSTNM)
GROUP BY INSTNM
ORDER BY numusers DESC
LIMIT 5