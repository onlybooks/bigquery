def print_query_results(client,
                        station_name,
                        min_duration=0,
                        max_duration=84000):
  client = bigquery.Client()
  print_query_results(client, 'Kennington', 300)
  print_query_results(client, 'Hyde Park', 600, 6000)
