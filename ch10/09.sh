NOW=$(date +%s)
SNAPSHOT=$(echo "($NOW - 120)*1000" | bc)
bq --location=EU cp \
  ch10eu.restored_cycle_stations@$SNAPSHOT \
  ch10eu.restored_table