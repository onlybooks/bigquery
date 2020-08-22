NOW=$(date +%s)
START_TIME=$(echo "($NOW - 24*60*60)*1000" | bc)
bq --location=US ls -j -all --min_creation_time $START_TIME