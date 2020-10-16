DECLARE y ARRAY<STRUCT<trip_date DATE, ratio FLOAT64, num_trips_on_day INT64>>;
CALL ch08eu.sp_most_unusual(10, y);
SELECT y;