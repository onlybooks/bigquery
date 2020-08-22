CREATE OR REPLACE VIEW ch10eu.authorized_view_300 AS
SELECT
  * EXCEPT (bike_id, end_station_priority_id)
FROM
  [PROJECTID].ch07eu.cycle_hire_clustered
WHERE
  start_station_id = 300 OR end_station_id = 300