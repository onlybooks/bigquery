bq --location=US \
  load \
  --source_format=CSV --autodetect \
  ch04.college_scorecard \
  ./college_scorecard.csv.gz