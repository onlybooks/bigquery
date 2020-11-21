fmt = '{!s:<10} ' * len(rows.schema)
print(fmt.format(*[field.name for field in rows.schema]))
for row in rows:
    print(fmt.format(*row))
