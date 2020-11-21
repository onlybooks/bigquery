tf.estimator.inputs.pandas_input_fn(
    df,
    batch_size=128,
    num_epochs=10,
    shuffle=True,
    num_threads=8,
    target_column='duration'
)