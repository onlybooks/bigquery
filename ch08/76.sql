DECLARE columns ARRAY<STRUCT<column_name STRING, date DATE>>;
SET columns = (
  WITH all_date_columns AS (
    SELECT column_name,
           parse_date('_%m_%d_%y', column_name) AS date
    FROM `bigquery-public-data`.covid19_jhu_csse.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'confirmed_cases'
          AND STARTS_WITH(column_name, '_')
  )
  SELECT ARRAY_AGG(STRUCT(column_name, date)
                   ORDER BY date DESC LIMIT 3) AS columns
  FROM all_date_columns
);
EXECUTE IMMEDIATE format("""
  SELECT
    country_region, province_state,
    %s AS cases_day0, '%t' AS date_day0,
    %s AS cases_day1, '%t' AS date_day1,
    %s AS cases_day2, '%t' AS date_day2
  FROM `bigquery-public-data`.covid19_jhu_csse.confirmed_cases
  WHERE country_region LIKE ‘Canada’
  ORDER BY cases_day0 DESC
""",
columns[OFFSET(0)].column_name, columns[OFFSET(0)].date,
columns[OFFSET(1)].column_name, columns[OFFSET(1)].date,
columns[OFFSET(2)].column_name, columns[OFFSET(2)].date,
);