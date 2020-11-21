NUM_TIMES=10
time for i in $(seq 1 $NUM_TIMES); do
echo -en "\r ... $i / $NUM_NUMTIMES ..."
curl --silent \
    -H "Authorization: Bearer $access_token" \
    -H "Content-Type: application/json" \
    -X POST \
    -d "$request" \
    "https://www.googleapis.com/bigquery/v2/projects/$PROJECT/queries" > /dev/null
done