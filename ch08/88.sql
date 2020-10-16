SELECT
  name
  , MD5(name) AS md5_
  , SHA256(name) AS sha256_
  , SHA512(name) AS sha512_
FROM UNNEST(['Joe Customer', 'Jane Employee']) AS name