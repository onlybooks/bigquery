MERGE ch08eu.hydepark_stations T
USING
  (SELECT *
  FROM `bigquery-public-data`.london_bicycles.cycle_stations
  WHERE name LIKE '%Hyde%') S
ON T.id = S.id
WHEN MATCHED THEN
  UPDATE
  SET bikes_count = S.bikes_count
WHEN NOT MATCHED BY TARGET THEN
  INSERT(id, installed, locked, name, bikes_count)
  VALUES(id, installed, locked,name, bikes_count)
WHEN NOT MATCHED BY SOURCE THEN
  DELETE