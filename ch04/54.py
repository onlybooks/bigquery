INPATTERNS = 'gs://bigquery-oreilly-book/college_*.csv'
RUNNER = 'DataflowRunner'
with beam.Pipeline(RUNNER, options = opts) as p:
    (p
     | 'read' >> beam.io.ReadFromText(INPATTERNS, skip_header_lines=1)
     | 'parse_csv' >> beam.FlatMap(parse_csv)
     | 'pull_fields' >> beam.FlatMap(pull_fields)
     | 'write_bq' >> beam.io.gcp.bigquery.WriteToBigQuery(bqtable, bqdataset, schema=get_output_schema())
     )