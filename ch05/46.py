job = bq.query(query, location='EU')
fmt = '{!s:<40} {:>10d} {:>10d}'
for row in job:
    fields = (row['start_station_name'],
             (int)(0.5 + row['duration']),
             row['num_trips'])
    print(fmt.format(*fields))
