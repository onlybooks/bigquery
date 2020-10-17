WITH example AS (
  SELECT * from unnest([
    'Seattle', 'New York', 'சிங்கப்பூர்', '東京'
  ]) AS city
)
SELECT 
  city
  , CHAR_LENGTH(city) AS char_len
  , TO_CODE_POINTS(city)[OFFSET(1)] AS first_code_point
  , ARRAY_LENGTH(TO_CODE_POINTS(city)) AS num_code_points
  , CAST (city AS BYTES) AS bytes
  , BYTE_LENGTH(city) AS byte_len
FROM example