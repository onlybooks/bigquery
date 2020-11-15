#!/bin/bash
bq_safe_mk() {
  dataset=$1
  exists=$(bq ls --dataset | grep -w $dataset)
  if [ -n "$exists" ]; then
    echo "Not creating $dataset since it already exists"
  else
    echo "Creating $dataset"
    bq mk $dataset
  fi
}
# 이 함수를 호출하는 방법
bq_safe_mk ch05