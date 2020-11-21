from google.cloud import bigquery
from datetime import datetime
from datetime import timedelta
import pytz


def print_query_results(client, mid_time):
    start_time = mid_time - timedelta(minutes=30)
    end_time = mid_time + timedelta(minutes=30)
