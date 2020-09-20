SELECT title, SUM(views) AS views
FROM `fh-bigquery.wikipedia_v3.pageviews_2017`
WHERE DATE(datehour) BETWEEN '2017-06-01' AND '2017-06-30'
AND wiki = 'en'
AND title LIKE '%Liberia%'
GROUP BY title