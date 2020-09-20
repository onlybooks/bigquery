WITH example AS (
  SELECT * from unnest([
    'Seattle', 'New York', 'சிங்கப்பூர்', '東京'
  ]) AS city
)
SELECT 
  city
  , UPPER(city) AS allcaps
  , CAST(city AS BYTES) as bytes
FROM example