def pull_fields(rowdict):
    result = {}
    # 필요한 문자열 필드
    for col in 'INSTNM'.split(','):
        if col in rowdict:
            result[col] = rowdict[col]
        else:
            logging.info('Ignoring line missing {}', col)
            return

    # 부동소수점 필드
    for col in 'ADM_RATE_ALL,FIRST_GEN,MD_FAMINC,SAT_AVG,MD_EARN_WNE_P10'.split(','):
        try:
            result[col] = (float) (rowdict[col])
        except:
            result[col] = None
    yield result
