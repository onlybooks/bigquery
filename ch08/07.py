client = bigquery.Client()
print_query_results(client, datetime(2015, 12, 25, 15, 0, tzinfo=pytz.UTC))
