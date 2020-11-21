echo "SELECT MAX(duration) FROM \
`bigquery-public-data`.london_bicycles.cycle_hire" \
| bq query --use_legacy_sql=false