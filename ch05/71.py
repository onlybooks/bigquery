def compute_fit(row):
    from scipy import stats
    result = {}
    result['station_id'] = row['start_station_id']
    durations = row['duration_array']
    ag, bg, cg = stats.gamma.fit(durations)
    result['ag'] = ag
    result['bg'] = bg
    result['cg'] = cg
    return result
