def parse_csv(line):
    try:
        values = line.split(',')
        rowdict = {}
        for colname, value in zip(COLNAMES, values):
            rowdict[colname] = value
            yield rowdict
    except:
        logging.warn('Ignoring line ...')
