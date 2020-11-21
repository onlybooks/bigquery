BI_PROJECT=... # 이 프로젝트가 실행하는 쿼리는 예약 슬롯을 사용한다
bq mk --reservation_assignment \
      --reservation_id=${IT_PROJECT}:US.bi_team \
      --job_type=QUERY --assignee_type=PROJECT \