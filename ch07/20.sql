SELECT
  EXTRACT (DATE FROM start_date) AS trip_date
  , APPROX_QUANTILES(duration / typical_duration, 10)[OFFSET(5)] AS ratio
  , COUNT(*) AS num_trips_on_day
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire AS hire
JOIN ch07eu.typical_trip AS trip
ON
  hire.start_station_name = trip.start_station_name
  AND hire.end_station_name = trip.end_station_name
  AND num_trips > 10
GROUP BY trip_date
HAVING num_trips_on_day > 10
ORDER BY ratio DESC
LIMIT 10