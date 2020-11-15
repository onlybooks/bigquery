DECLARE NUM_CLUSTERS INT64 DEFAULT 3;
DECLARE MIN_ERROR FLOAT64 DEFAULT 1000.0;
DECLARE BEST_NUM_CLUSTERS INT64 DEFAULT -1;
DECLARE MODEL_NAME STRING;
DECLARE error FLOAT64 DEFAULT 0;
 
WHILE NUM_CLUSTERS < 8 DO
 
  SET MODEL_NAME = CONCAT('ch09eu.london_station_clusters_', 
                            CAST(NUM_CLUSTERS AS STRING));
 
  EXECUTE IMMEDIATE format("""
  CREATE OR REPLACE MODEL %s
    OPTIONS(model_type='kmeans', 
            num_clusters=%d, 
            standardize_features = true) AS
    SELECT * except(station_name)
    from ch09eu.stationstats;
  """, MODEL_NAME, NUM_CLUSTERS);
    
  EXECUTE IMMEDIATE format("""
    SELECT davies_bouldin_index FROM ML.EVALUATE(MODEL %s);
  """, MODEL_NAME) INTO error;
  
    IF error < MIN_ERROR THEN
       SET MIN_ERROR = error;
       SET BEST_NUM_CLUSTERS = NUM_CLUSTERS;
    END IF;
  SET NUM_CLUSTERS = NUM_CLUSTERS + 1;
 
END WHILE