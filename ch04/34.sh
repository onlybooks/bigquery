LOC="--location US"
OUTPUT=/tmp/college_scorecard_def.json
bq $LOC \
  mkdef \
  --source_format=CSV \
  --noautodetect \
  $INPUT \
  $SCHEMA \
  | sed 's/"skipLeadingRows": 0/"skipLeadingRows": 1/g' \
  | sed 's/"allowJaggedRows": false/"allowJaggedRows": true/g' \
  > $OUTPUT