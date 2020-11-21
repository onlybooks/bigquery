def print_query_results(client, params):
    query = """
        SELECT
          start_station_name
          , AVG(duration) as avg_duration
        FROM
          `bigquery-public-data`.london_bicycles.cycle_hire
        WHERE
          start_station_name LIKE CONCAT('%', ?, '%')
          AND duration BETWEEN ? AND ?
        GROUP BY start_station_name
    """

    query_params = [
        bigquery.ScalarQueryParameter(
            None, "STRING", params[0]),
        bigquery.ScalarQueryParameter(
            None, "FLOAT64", params[1]),
        bigquery.ScalarQueryParameter(
            None, "FLOAT64", params[2]),
    ]
