SELECT
  LPAD('Hello', 10, '*') -- left pad with *
  , RPAD('Hello', 10, '*') -- right pad
  , LPAD('Hello', 10) -- left pad with spaces
  , LTRIM('   Hello   ') -- trim whitespace on left
  , RTRIM('   Hello   ') -- trim whitespace on right
  , TRIM ('   Hello   ') -- trim whitespace both ends
  , TRIM ('***Hello***', '*') -- trim * both ends
  , REVERSE('Hello') -- reverse the string