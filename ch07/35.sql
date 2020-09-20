SELECT
  author.tz_offset, ARRAY_AGG(STRUCT(author, committer, subject, message, trailer, difference, encoding) ORDER BY author.date.seconds LIMIT 1000)
FROM `bigquery-public-data.github_repos.commits`
GROUP BY author.tz_offset