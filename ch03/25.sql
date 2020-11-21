SELECT
  LPAD('Hello', 10, '*') -- 왼쪽에 *가 추가된다
  , RPAD('Hello', 10, '*') -- 오른쪽에 *가 추가된다
  , LPAD('Hello', 10) -- 왼쪽에 공백이 추가된다
  , LTRIM('   Hello   ') -- 왼쪽의 공백이 제거된다
  , RTRIM('   Hello   ') -- 오른쪽의 공백이 제거된다
  , TRIM ('   Hello   ') -- 양쪽의 공백이 제거된다
  , TRIM ('***Hello***', '*') -- 양쪽의 *이 제거된다
  , REVERSE('Hello') -- 문자열이 뒤바뀐다