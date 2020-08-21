bq mkdef --source_format=CSV \
  --autodetect \
  gs://bigquery-oreilly-book/college_* \
  > /tmp/mytable.json