CREATE OR REPLACE FUNCTION ch09eu.arr_to_input_3(a ARRAY<FLOAT64>)
RETURNS STRUCT<a1 FLOAT64, a2 FLOAT64, a3 FLOAT64> AS (
STRUCT(
  a[OFFSET(0)]
  , a[OFFSET(1)]
  , a[OFFSET(2)]
));