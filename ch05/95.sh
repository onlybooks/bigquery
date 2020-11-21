#!/bin/bash
read -d '' QUERY_TEXT << EOF
SELECT
  start_station_name
  , duration/60 AS duration_minutes
FROM \`bigquery-public-data\`.london_bicycles.cycle_hire
EOF
bq mk --view=$QUERY_TEXT ch05.rental_duration