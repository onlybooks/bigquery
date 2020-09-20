SELECT
  repo_name, author.tz_offset
  , ARRAY_AGG(STRUCT(author, committer, subject, message, trailer, difference, encoding) ORDER BY author.date.seconds)
FROM `bigquery-public-data.github_repos.commits`, UNNEST(repo_name) AS repo_name
GROUP BY repo_name, author.tz_offset