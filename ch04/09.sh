zless ./college_scorecard.csv.gz | \
  sed 's/PrivacySuppressed/NULL/g' | \
  gzip > /tmp/college_scorecard.csv.gz