def pull_fields(rowdict):
  result = {}
  # required string fields
  for col in 'INSTNM'.split(','):
    if col in rowdict:
      result[col] = rowdict[col]
    else:
      logging.info('Ignoring line missing {}', col)
      return

  # float fields
  for col in 'ADM_RATE_ALL,FIRST_GEN,MD_FAMINC,SAT_AVG,MD_EARN_WNE_P10'.split(','):
    try:
      result[col] = (float) (rowdict[col])
    except:
      result[col] = None
  yield result