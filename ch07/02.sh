read -d '' QUERY_TEXT << EOF
SELECT
  start_station_name
  , AVG(duration) as duration
  , COUNT(duration) as num_trips
FROM \`bigquery-public-data\`.london_bicycles.cycle_hire
GROUP BY start_station_name
ORDER BY num_trips DESC
LIMIT 5
EOF

read -d '' request << EOF
{
  "useLegacySql": false,
  "useQueryCache": false,
  "query": \"${QUERY_TEXT}\"
}
EOF
request=$(echo "$request" | tr '\n' ' ')