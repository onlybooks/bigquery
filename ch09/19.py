def compute_classifier(rowdict, numeric_weights, scaling_df, categorical_weights):
    pred=compute_regression(rowdict, numeric_weights, scaling_df, categorical_weights)
    return (1.0/(1 + np.exp(-pred)) if (-500 < pred) else 0)
