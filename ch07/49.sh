JOBSURL="https://www.googleapis.com/bigquery/v2/projects/$PROJECT/jobs"
FIELDS="statistics(query(queryPlan(steps)))"
curl --silent \
    -H "Authorization: Bearer $access_token" \
    -H "Accept-Encoding: gzip" \
    -H "User-Agent: get_job_details (gzip)" \
    -X GET \
    "${JOBSURL}/${JOBID}?fields=${FIELDS}" \
| zcat