bq mk --table \
  --expiration 3600 \
  --description "One hour of data" \
  --label persistence:volatile \
  ch05.rentals_last_hour rental_id:STRING,duration:FLOAT