CREATE OR REPLACE VIEW ecommerce.vw_large_transactions
OPTIONS(
  description="large transactions for review",
  labels=[('org_unit', 'loss_prevention')],
  expiration_timestamp=TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
) AS

SELECT
  visitorId,
  REGEXP_EXTRACT(SESSION_USER(), r'@(.+)') AS user_domain,
  REGEXP_EXTRACT(visitorEmailAddress, r'@(.+)') AS customer_domain,
  date,
  totals.transactions,
  totals.transactionRevenue,
  totals.totalTransactionRevenue,
  totals.timeOnScreen
FROM
  `bigquery-public-data`.google_analytics_sample.ga_sessions_20170801
WHERE
  (totals.totalTransactionRevenue / 1000000) > 1000
  AND REGEXP_EXTRACT(visitorEmailAddress, r'@(.+)') = REGEXP_EXTRACT(SESSION_USER(), r'@(.+)')
ORDER BY totals.totalTransactionRevenue DESC
LIMIT 10