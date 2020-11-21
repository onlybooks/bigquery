dsinfo = bq.get_dataset("ch05")
entry = bigquery.AccessEntry(
    role="READER",
    entity_type="userByEmail",
    entity_id="xyz@google.com",
)
if entry not in dsinfo.access_entries:
    entries = list(dsinfo.access_entries)
    entries.append(entry)
    dsinfo.access_entries = entries
    dsinfo = bq.update_dataset(dsinfo, ["access_entries"])  # API request
else:
    print('{} already has access'.format(entry.entity_id))
print(dsinfo.access_entries)
