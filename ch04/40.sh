mysql somedb < select_data.sql | \
  gsutil cp - gs://BUCKET/data_$(date -u "+%F-%T").tsv
