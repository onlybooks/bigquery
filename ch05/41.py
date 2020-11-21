page_size = 10000
row_iter = bq.list_rows(table,
                        page_size=page_size)
for page in row_iter.pages:
    rows = list(page)
    # 로드된 행에 대해 필요한 작업을 실행한다.
    print(len(rows))
