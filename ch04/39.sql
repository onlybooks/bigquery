SELECT
  REGEXP_EXTRACT(protopayload_auditlog.resourceName, '^projects/[^/]+/datasets/([^/]+)/tables') AS datasetRef,
  COUNTIF(JSON_EXTRACT(protopayload_auditlog.metadataJson, "$.tableDataRead") IS NOT NULL) AS dataReadEvents
FROM ch04.cloudaudit_googleapis_com_data_access_2019*
WHERE
  JSON_EXTRACT(protopayload_auditlog.metadataJson, "$.tableDataRead") IS NOT NULL
GROUP BY datasetRef
ORDER BY dataReadEvents DESC
LIMIT 5