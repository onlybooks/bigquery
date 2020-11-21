SELECT
  input,
  (SELECT AS STRUCT(p, ['github', 'nytimes', 'techcrunch'][ORDINAL(s)]) prediction
FROM
  (SELECT p, ROW_NUMBER() OVER() AS s FROM
  (SELECT * FROM UNNEST(dense_1) AS p))
ORDER BY p DESC LIMIT 1).*
FROM ML.PREDICT(MODEL advdata.txtclass_tf,
(
SELECT 'Unlikely Partnership in House Gives Lawmakers Hope for Border Deal' AS
input
UNION ALL SELECT "Fitbit\'s newest fitness tracker is just for employees AND
health insurance members"
UNION ALL SELECT "Show HN: Hello, a CLI tool for managing social media"
))