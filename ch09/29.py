import matplotlib.pyplot as plt
import pandas as pd
def plot_historical_and_forecast(
        input_timeseries, forecast_output,
        timestamp_col_name, data_col_name):


    plt.figure(figsize=(20, 6))
    plt.plot(input_timeseries[timestamp_col_name],
             input_timeseries[data_col_name], label='Historical')
    plt.xlabel(timestamp_col_name)
    plt.ylabel(data_col_name)
    forecast_output['forecast_timestamp'] = pd.to_datetime(
        forecast_output['forecast_timestamp'])
    x_data = forecast_output['forecast_timestamp']
    y_data = forecast_output['forecast_value']
    confidence_level = (forecast_output['confidence_level'].iloc[0] * 100)
    low_CI = forecast_output['confidence_interval_lower_bound']
    upper_CI = forecast_output['confidence_interval_upper_bound']
    # 데이터 출력, 줄 너비, 색상 등을 설정한다
    # 줄의 투명도를 설정하고 범주에 레이블을 제공한다
    plt.plot(x_data, y_data, alpha=1,
             label='Forecast', linestyle='--')
    # 신뢰 간격을 표현한다
    plt.fill_between(x_data, low_CI, upper_CI,
                     color='#539caf', alpha=0.4,
                     label=str(confidence_level) + '% confidence interval')
    # 범주를 표시한다
    plt.legend(loc='upper center', prop={'size': 16})
    plot_historical_and_forecast(df, fcst, 'date', 'numrentals')
