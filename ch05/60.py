stations_to_examine = []
for band in range(1,5):
  min_trips = badtrips['num_trips'].quantile(0.2*(band))
  max_trips = badtrips['num_trips'].quantile(0.2*(band+1))
  query = 'num_trips >= {} and num_trips < {}'.format(min_trips, max_trips)
  print(query) # band
  stations = badtrips.query(query)
  stations = stations.sort_values(
    by=['fraction_bad'],
    ascending=False)[:5]
  print(stations) # 5 worst
  stations_to_examine.append(stations)
  print()
