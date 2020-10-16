CREATE OR REPLACE MODEL ch09eu.london_station_clusters
OPTIONS(model_type='kmeans',
        num_clusters=4,
        standardize_features = true) AS
      
SELECT * EXCEPT(station_name)
FROM ch09eu.stationstats