EXECUTE IMMEDIATE """
  SELECT country_region, province_state, _5_18_20 AS cases
  FROM `bigquery-public-data`.covid19_jhu_csse.confirmed_cases
  WHERE country_region LIKE @country
  ORDER BY cases DESC LIMIT 3
"""
USING 'Canada' AS country;