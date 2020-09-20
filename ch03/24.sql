SELECT
  ENDS_WITH('Hello', 'o') -- true
  , ENDS_WITH('Hello', 'h') -- false
  , STARTS_WITH('Hello', 'h') -- false
  , STRPOS('Hello', 'e') -- 2
  , STRPOS('Hello', 'f') -- 0 for not-found
  , SUBSTR('Hello', 2, 4) -- 1-based
  , CONCAT('Hello', 'World')