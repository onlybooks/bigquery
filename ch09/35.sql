SELECT * EXCEPT (nearest_centroids_distance)
FROM ML.PREDICT(MODEL ch09eu.london_station_clusters,
  (SELECT * FROM ch09eu.stationstats
  WHERE REGEXP_CONTAINS(station_name, 'Kennington')))