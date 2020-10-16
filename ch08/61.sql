CREATE OR REPLACE FUNCTION ch08eu.computePrice(dur INT64)
RETURNS INT64
LANGUAGE js AS """
  function factorial(n) {
    return (n > 1) ? n * factorial(n - 1) : 1;
  }
  var nhours = 1 + Math.floor(dur/3600.0);
  var f = factorial(nhours);
  var discount = 0.8/(1+Math.pow(Math.E, -f));
  return 3 + Math.floor(dur * (1-discount) * 0.0023)
""";

SELECT
  duration, ch08eu.computePrice(duration) AS price
FROM
  `bigquery-public-data`.london_bicycles.cycle_hire
LIMIT 5