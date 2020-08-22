dataset_id = "{}.ch05eu".format(PROJECT)
dsinfo = bigquery.Dataset(dataset_id)
dsinfo.location = 'EU'
ds = bq.create_dataset(dsinfo, exists_ok=True)
