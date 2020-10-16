CREATE OR REPLACE MODEL ch09eu.bicycle_model_bucketized_seq
TRANSFORM(* EXCEPT(start_date)
  , IF(EXTRACT(dayofweek FROM start_date) BETWEEN 2 and 6, 'weekday', 'weekend') as dayofweek
  , ML.BUCKETIZE(EXTRACT(HOUR FROM start_date), [5, 10, 17]) AS hourofday
  , start_date # used to split the data
)
OPTIONS(input_label_cols=['duration'], model_type='linear_reg',
        data_split_method='seq',
        data_split_eval_fraction=0.2,
        data_split_col='start_date')
AS

SELECT
    duration
    , start_station_name
    , start_date
FROM `bigquery-public-data`.london_bicycles.cycle_hire