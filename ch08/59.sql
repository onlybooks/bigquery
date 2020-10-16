UPDATE ch08eu.stations_table
SET maintenance = ARRAY_CONCAT(maintenance,
  ARRAY_STRUCT<time TIMESTAMP, employeeID STRING>[
    (CURRENT_TIME(), emp303)
  ]
)
WHERE id = 303