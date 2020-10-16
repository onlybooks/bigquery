reader = tf.contrib.cloud.BigQueryReader(project_id=PROJECT,
                                         dataset_id=DATASET,
                                         table_id=TABLE,
                                         timestamp_millis=TIME,
                                         num_partitions=NUM_PARTITIONS,
                                         features=features)
