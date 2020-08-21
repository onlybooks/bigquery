bq --location=US \
  load --null_marker=NULL --replace \
  --source_format=CSV --autodetect \
  ch04.college_scorecard \
  ./college_scorecard.csv.gz