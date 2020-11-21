class Params:
    def __init__(self, num_clusters):
        self._num_clusters = num_clusters
        self._model_name = (
            'ch09eu.london_station_clusters_{}'.format(num_clusters))
        self._train_query = """
            CREATE OR REPLACE MODEL {}
            OPTIONS(model_type='kmeans',
                num_clusters={},
                standardize_features = true) AS
            SELECT * except(station_name)
            FROM ch09eu.stationstats
        """.format(self._model_name, self._num_clusters)
        self._eval_query = """
            SELECT davies_bouldin_index AS error
            FROM ML.EVALUATE(MODEL {});
        """.format(self._model_name)
        self._error = None

    def run(self):
        bq = bigquery.Client(project=PROJECT)
        job = bq.query(self._train_query, location='EU')
        job.result() # wait for job to finish
        evaldf = bq.query(self._eval_query, location='EU').to_dataframe()
        self._error = evaldf['error'][0]
        return self

