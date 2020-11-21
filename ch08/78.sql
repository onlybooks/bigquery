EXECUTE IMMEDIATE """
  SELECT country_region, province_state, _5_18_20 AS cases
  FROM `bigquery-public-data`.covid19_jhu_csse.confirmed_cases
  WHERE country_region LIKE ?
  ORDER BY cases DESC LIMIT ?
"""
USING 'Canada', 3;