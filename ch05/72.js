function createBigQueryPresentation() {
  var spreadsheet = runQuery();
  Logger.log('Results spreadsheet created: %s', spreadsheet.getUrl());
  var chart = createColumnChart(spreadsheet); // UPDATED
  var deck = createSlidePresentation(spreadsheet, chart); // NEW
  Logger.log('Results slide deck created: %s', deck.getUrl()); // NEW
}