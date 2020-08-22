dsinfo = bq.get_dataset("ch05")
print(dsinfo.description)
dsinfo.description = "Chapter 5 of BigQuery: The Definitive Guide"
dsinfo = bq.update_dataset(dsinfo, ['description'])
print(dsinfo.description)