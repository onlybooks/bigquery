SELECT date, HLL_COUNT.MERGE(sketch)
FROM approx_distinct_users_agg
GROUP BY date