MERGE ch07eu.cycle_hire_clustered all_hires
USING ch07eu.cycle_hire_corrections some_month
ON all_hires.start_station_name = some_month.start_station_name
WHEN MATCHED
  AND all_hires._PARTITIONTIME = DATE(some_month.start_date) THEN
  INSERT (rental_id, duration, ...)
  VALUES (rental_id, duration, ...)