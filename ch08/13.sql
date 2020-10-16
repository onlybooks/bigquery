WITH overnight_trips AS (
  SELECT
    duration
    , dayOfWeek(start_date) AS start_day
  FROM
    `bigquery-public-data`.london_bicycles.cycle_hire
  WHERE
    getDate(start_date) != getDate(end_date)
)