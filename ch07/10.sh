JOBID=8adbf3fd-e310-44bb-9c6e-88254958ccac # CHANGE
access_token=$(gcloud auth application-default print-access-token)
PROJECT=$(gcloud config get-value project)
curl --silent \
    -H "Authorization: Bearer $access_token" \
    -X GET \
    "https://www.googleapis.com/bigquery/v2/projects/$PROJECT/jobs/$JOBID"