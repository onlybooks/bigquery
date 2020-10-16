query = """
  SELECT
    start_station_name
    , AVG(duration) as avg_duration
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE
    start_station_name LIKE CONCAT('%', @STATION, '%')
    AND duration BETWEEN @MIN_DURATION AND @MAX_DURATION
  GROUP BY start_station_name
"""
