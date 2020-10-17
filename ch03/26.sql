SELECT
  column
  , REGEXP_CONTAINS(column, r'\d{5}(?:[-\s]\d{4})?') has_zipcode
  , REGEXP_CONTAINS(column, r'^\d{5}(?:[-\s]\d{4})?$') is_zipcode
  , REGEXP_EXTRACT(column, r'\d{5}(?:[-\s]\d{4})?') the_zipcode
  , REGEXP_EXTRACT_ALL(column, r'\d{5}(?:[-\s]\d{4})?') all_zipcodes
  , REGEXP_REPLACE(column, r'\d{5}(?:[-\s]\d{4})?', '*****') masked
FROM (
  SELECT * FROM UNNEST([
     '12345', '1234', '12345-9876', 
     'abc 12345 def', 'abcde-fghi',
     '12345 ab 34567', '12345 9876'
  ]) AS column
)