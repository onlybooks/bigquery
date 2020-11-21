# 가장 최근에 성공한 5개의 작업
JOBS=$(bq ls -j -n 50 | grep SUCCESS | head -5 | awk '{print $1}')

BATCHURL="https://www.googleapis.com/batch/bigquery/v2"
JOBSPATH="/projects/$PROJECT/jobs"
FIELDS="statistics(query(queryPlan(steps)))"

request=""
for JOBID in $JOBS; do
read -d '' part << EOF
--batch_part_starts_here
GET ${JOBSPATH}/${JOBID}?fields=${FIELDS}
EOF
request=$(echo "$request"; echo "$part")
done

curl --silent \
    -H "Authorization: Bearer $access_token" \
    -H "Content-Type: multipart/mixed; boundary=batch_part_starts_here" \
    -X POST \
    -d "$request" \
    "${BATCHURL}"