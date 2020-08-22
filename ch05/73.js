var queryResults = BigQuery.Jobs.query(request, PROJECT_ID);
var rows = queryResults.rows;
while (queryResults.pageToken) {
  queryResults = BigQuery.Jobs.getQueryResults(
    PROJECT_ID,
    jobId,
    {
      pageToken: queryResults.pageToken
    }
  );
  rows = rows.concat(queryResults.rows);
}