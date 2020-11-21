curl -H "Authorization: Bearer $access_token" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "$request" \
  "https://www.googleapis.com/bigquery/v2/projects/$PROJECT/queries"