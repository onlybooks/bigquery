query2 = """
SELECT
  start_station_name
  , COUNT(duration) as num_trips
FROM `bigquery-public-data`.london_bicycles.cycle_hire
WHERE duration >= {}
GROUP BY start_station_name
ORDER BY num_trips DESC
LIMIT 10
""".format(min_duration)
