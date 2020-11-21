tfexample = tf.train.Example(
    features=tf.train.Features(
        feature={
            'start_station_name': _bytes_feature(row['start_station_name']),
            'duration': _int64_feature(row['duration']),
    }))
