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
# this is how you call the function
bq_safe_mk ch05