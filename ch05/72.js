function createBigQueryPresentation() {
  var spreadsheet = runQuery();
  Logger.log('Results spreadsheet created: %s', spreadsheet.getUrl());
  var chart = createColumnChart(spreadsheet); 
  var deck = createSlidePresentation(spreadsheet, chart); 
  Logger.log('Results slide deck created: %s', deck.getUrl()); 
}