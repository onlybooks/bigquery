import pandas as pd

data = [
    (1, u'What is BigQuery?'),
    (2, u'Query essentials'),
]
df = pd.DataFrame(data, columns=['chapter', 'title'])
