bq --location=US \
  load --null_marker=NULL --replace \
  --source_format=CSV \
  --schema=schema.json --skip_leading_rows=1 \
  ch04.college_scorecard \
  ./college_scorecard.csv.gz