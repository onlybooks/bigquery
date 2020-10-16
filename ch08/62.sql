CREATE TEMPORARY FUNCTION computePrice(dur INT64)
RETURNS INT64
LANGUAGE js AS """
  var nhours = 1 + Math.floor(dur/3600.0);
  var f = factorial(nhours);
  var discount = 0.8/(1+Math.pow(Math.E, -f));
  return 3 + Math.floor(dur * (1-discount) * 0.0023)
"""
OPTIONS (
  library=["gs://somebucket/path/to/mathfn.js",
           "gs://somebucket/path/to/someother.js"]
);