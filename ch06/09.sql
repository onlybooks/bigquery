WITH
repo_commits AS (
  SELECT repos AS repo_name, author.name AS author
  FROM `bigquery-public-data.github_repos.commits` c, c.repo_name repos
  -- WHERE author.name IN ("Valliappa Lakshmanan", "Jordan Tigani")
  GROUP BY repos, author
),
repo_languages AS (
  SELECT lang.name AS lang, lang.bytes AS lang_bytes, repos.repo_name AS repo_name
  FROM `bigquery-public-data.github_repos.languages` repos, repos.LANGUAGE AS lang
)

SELECT lang, author, SUM(lang_bytes) AS total_bytes
FROM repo_languages
JOIN repo_commits USING (repo_name)
GROUP BY lang, author
ORDER BY total_bytes DESC
LIMIT 100