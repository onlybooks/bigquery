fmt = '{!s:<40} {:>10d}'
for row in job:
    fields = (row['start_station_name'], row['num_trips'])
    print(fmt.format(*fields))
