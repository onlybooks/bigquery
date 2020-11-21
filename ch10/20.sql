SELECT
  invoice.month
  , label.value
  , ROUND(SUM(cost)
    + SUM(IFNULL((SELECT SUM(c.amount) FROM UNNEST(credits) c), 0))
    , 2) AS monthly_cost
FROM ch10eu.gcp_billing_export_v1_XXXXXX_XXXXXX_XXXXXX , UNNEST(labels) AS label
WHERE
  label.key = 'environment'
GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC