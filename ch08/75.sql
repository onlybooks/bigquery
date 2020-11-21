DECLARE col_0 STRING;
SET col_0 = '_5_18_20';
EXECUTE IMMEDIATE format("""
  SELECT
  country_region, province_state,
  %s AS cases_day0
  FROM `bigquery-public-data`.covid19_jhu_csse.confirmed_cases
  WHERE country_region LIKE 'Canada'
  ORDER BY cases_day0 DESC
""", col_0);