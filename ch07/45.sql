INSERT INTO approx_distinct_users_agg AS
SELECT date, product, country, HLL_COUNT.INIT(user_id) AS sketch
GROUP BY date, product, country, sketch