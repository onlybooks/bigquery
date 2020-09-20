WITH sketch AS (
SELECT
  HLL_COUNT.INIT(start_station_name) AS hll_start
  , HLL_COUNT.INIT(end_station_name) AS hll_end
FROM `bigquery-public-data`.london_bicycles.cycle_hire
)

SELECT
  HLL_COUNT.MERGE(hll_start) AS distinct_start
  , HLL_COUNT.MERGE(hll_end) AS distinct_end
  , HLL_COUNT.MERGE(hll_both) AS distinct_station
FROM sketch, UNNEST([hll_start, hll_end]) AS hll_both