opts = beam.pipeline.PipelineOptions(flags=[], **options)
RUNNER = 'DataflowRunner'
query = """
  SELECT start_station_id, ARRAY_AGG(duration) AS duration_array
  FROM `bigquery-public-data.london_bicycles.cycle_hire`
  GROUP BY start_station_id
"""

with beam.Pipeline(RUNNER, options=opts) as p:
    (p
     | 'read_bq' >> beam.io.Read(beam.io.BigQuerySource(query=query))
     | 'compute_fit' >> beam.Map(compute_fit)
     | 'write_bq' >> beam.io.gcp.bigquery.WriteToBigQuery('ch05eu.station_stats',
                                                          schema='station_id:string,ag:FLOAT64,bg:FLOAT64,cg:FLOAT64')
     )
