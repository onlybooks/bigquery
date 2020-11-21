query = """
    SELECT
        start_station_id
        , COUNT(*) AS num_trips
    FROM
        `bigquery-public-data`.london_bicycles.cycle_hire
    WHERE
        start_station_id IN UNNEST(@STATIONS)
    AND duration BETWEEN @MIN_DURATION AND @MAX_DURATION
    GROUP BY start_station_id
"""
query_params = [
    bigquery.ArrayQueryParameter(
        'STATIONS', "INT64", ids),
    bigquery.ScalarQueryParameter(
        'MIN_DURATION', "FLOAT64", min_duration),
    bigquery.ScalarQueryParameter(
        'MAX_DURATION', "FLOAT64", max_duration),
]
