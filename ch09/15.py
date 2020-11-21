def compute_regression(rowdict, numeric_weights, scaling_df, categorical_weights):
    input_values = rowdict
    # 수치형 변수
    pred = 0
    for column_name in numeric_weights['input'].unique():
        wt = numeric_weights[ numeric_weights['input'] == column_name ]['input_weight'].values[0]
        if column_name != '__INTERCEPT__':
            meanv = scaling_df[ scaling_df['input'] == column_name]['mean'].values[0]
            stddev = scaling_df[ scaling_df['input'] == column_name]['stddev'].values[0]
            scaled_value = (input_values[column_name] - meanv)/stddev
        else:
            scaled_value = 1.0
            contrib = wt * scaled_value
            pred = pred + contrib
    # 범주형 변수
    for column_name in categorical_weights['input'].unique():
        category_weights = categorical_weights[categorical_weights['input'] == column_name]
        wt = category_weights[category_weights['category_name'] == input_values[column_name]]['category_weight'].values[0]
        pred = pred + wt
    return pred
