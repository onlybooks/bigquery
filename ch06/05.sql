SELECT title, COUNT(title) as c
FROM `bigquery-samples.wikipedia_benchmark.Wiki1B`
WHERE title LIKE "G%o%o%g%l%e"
GROUP BY title
ORDER BY c DESC