queue = tf.train.string_input_producer(reader.partitions())
row_id, examples_serialized = reader.read(queue)
examples = tf.parse_example(examples_serialized, features=features)
