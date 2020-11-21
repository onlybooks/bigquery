def train_and_evaluate(args):
    model_name = "ch09eu.bicycle_model_dnn_{}_{}_{}_{}".format(
        args.afternoon_start, args.afternoon_end, args.num_nodes_0, args.num_nodes_1
    )
    train_query = """
        CREATE OR REPLACE MODEL {}
        TRANSFORM(* EXCEPT(start_date)
                  , IF(EXTRACT(dayofweek FROM start_date) BETWEEN 2 AND 6, 'weekday', 'weekend') AS dayofweek
                  , ML.BUCKETIZE(EXTRACT(HOUR FROM start_date), [5, {}, {}]) AS hourofday
        )
        OPTIONS(input_label_cols=['duration'], 
                model_type='dnn_regressor',
                hidden_units=[{}, {}])
        AS

        SELECT 
          duration
          , start_station_name
          , start_date
        FROM `bigquery-public-data`.london_bicycles.cycle_hire
    """.format(model_name,
               args.afternoon_start,
               args.afternoon_end,
               args.num_nodes_0,
               args.num_nodes_1)
    logging.info(train_query)
    bq = bigquery.Client(project=args.project,
                         location=args.location,
                         credentials=get_credentials())
    job = bq.query(train_query)
    job.result() # wait for job to finish

    eval_query = """
        SELECT mean_absolute_error 
        FROM ML.EVALUATE(MODEL {})
    """.format(model_name)
    logging.info(eval_info)
    evaldf = bq.query(eval_query).to_dataframe()
    return evaldf['mean_absolute_error'][0]
