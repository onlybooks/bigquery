SELECT 
  state_name
FROM `bigquery-public-data.utility_us.us_states_area`
WHERE
   ST_CONTAINS(
     state_geom,
     ST_GeogPoint(-122.33, 47.61))