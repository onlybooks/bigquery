WITH example AS (
  SELECT * from unnest([
    'Seattle', 'New York', 'சிங்கப்பூர்', '東京'
  ]) AS city
)
SELECT 
  city
  , CHAR_LENGTH(city) as char_len
  , TO_CODE_POINTS(city)[OFFSET(1)] as first_code_point
  , ARRAY_LENGTH(TO_CODE_POINTS(city)) as num_code_points
  , CAST (city AS BYTES) as bytes
  , BYTE_LENGTH(city) as byte_len
FROM example