def features_and_labels(features):
    label = features.pop('Class')  # 이것이 학습할 데이터다
    return features, label

batch_size = 1024
dataset = (bqsession.parallel_read_rows()
           .prefetch(1)
           .map(features_and_labels)
           .shuffle(batch_size * 10)
           .batch(batch_size)
