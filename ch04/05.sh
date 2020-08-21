bq --location=US \
  load --null_marker=NULL \
  --source_format=CSV --autodetect \
  ch04.college_scorecard \
  ./college_scorecard.csv.gz