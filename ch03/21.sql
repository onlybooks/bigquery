WITH example AS (
  SELECT * FROM unnest([
    'Seattle', 'New York', 'சிங்கப்பூர்', '東京'
  ]) AS city
)
SELECT 
  city
  , UPPER(city) AS allcaps
  , CAST(city AS BYTES) AS bytes
FROM example