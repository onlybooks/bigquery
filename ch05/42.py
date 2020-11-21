fields = [field for field in table.schema if 'count' in field.name or field.name == 'id']
rows = bq.list_rows(table,
                    start_index=300,
                    max_results=5,
                    selected_fields=fields)
