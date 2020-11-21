table = bq.get_table("bigquery-public-data.london_bicycles.cycle_stations")
for field in table.schema:
    if 'count' in field.name:
        print(field)
