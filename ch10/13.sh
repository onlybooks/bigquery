IT_PROJECT=... # 이 프로젝트의 비용이 청구될 계정
bq mk --project_id=${IT_PROJECT} --location=US \
      --capacity_commitment --slots=5000 --plan=FLEX