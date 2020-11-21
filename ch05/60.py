stations_to_examine = []
for band in range(1, 5):
    min_trips = badtrips['num_trips'].quantile(0.2 * (band))
    max_trips = badtrips['num_trips'].quantile(0.2 * (band + 1))
    query = 'num_trips >= {} and num_trips < {}'.format(min_trips, max_trips)
    print(query)  # 묶음을 찾는다
    stations = badtrips.query(query)
    stations = stations.sort_values(
        by=['fraction_bad'],
        ascending=False)[:5]
    print(stations)  # 망친 나들이 비율이 가장 높은 5개
    stations_to_examine.append(stations)
    print()
