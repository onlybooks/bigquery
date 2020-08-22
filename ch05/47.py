query = """
SELECT
  start_station_name
  , AVG(duration) as duration
  , COUNT(duration) as num_trips
FROM `bigquery-public-data`.london_bicycles.cycle_hire
GROUP BY start_station_name
"""
df = bq.query(query, location='EU').to_dataframe()
print(df.describe())