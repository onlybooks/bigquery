features = dict(
  start_station_name=tf.FixedLenFeature([1], tf.string),
  duration=tf.FixedLenFeature([1], tf.int32))