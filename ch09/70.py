client = BigQueryClient()

GCP_PROJECT_ID='<프로젝트 이름>' # 과금이 발생할 프로젝트
COL_NAMES = ['Time', 'Amount', 'Class'] # 읽을 컬럼
COL_TYPES = [dtypes.float64, dtypes.float64, dtypes.float64]
ROW_RESTR = 'Time <= 144803'
DATASET_GCP_PROJECT_ID, DATASET_ID, TABLE_ID = (
  `bigquery-public-data.ml_datasets.ulb_fraud_detection').split('.')

bqsession = client.read_session(
       "projects/" + GCP_PROJECT_ID,
       DATASET_GCP_PROJECT_ID, TABLE_ID, DATASET_ID,
       COL_NAMES, COL_TYPES,
       requested_streams=2,
       row_restriction=row_restriction)