SELECT
  c.customer_id
  , c.gift_card_balance
  , rq.latest_order_date
FROM ch04.gift_cards AS c
LEFT OUTER JOIN EXTERNAL_QUERY(
  'connection_id',
  '''SELECT customer_id, MAX(order_date) AS latest_order_date
  FROM orders
  GROUP BY customer_id''') AS rq ON rq.customer_id = c.customer_id
WHERE c.gift_card_balance > 100
ORDER BY rq.latest_order_date ASC;