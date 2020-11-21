bq mkdef --source_format=CSV \
  --autodetect \
  gs://bigquery-oreilly-book/college_scorecard.csv \
  > /tmp/mytable.json

bq mk --external_table_definition=/tmp/mytable.json \
  ch04.college_scorecard