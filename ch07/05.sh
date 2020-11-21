read -d '' request << EOF
{
  "useLegacySql": false,
  "useQueryCache": true,
  "query": \"${QUERY_TEXT}\"
}
EOF