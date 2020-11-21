bq mk --transfer_config --data_source=cross_region_copy \
   --params={"source_dataset_id": "iowa_liquor_sales", \
             "source_project_id": "bigquery-public-data"}' \
   --target_dataset=ch10eu --display_name=liquor \
   --schedule_end_time=$(date -v +1H -u +%Y-%m-%dT%H:%M:%SZ)"