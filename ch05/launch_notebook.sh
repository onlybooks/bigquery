#!/bin/bash

gcloud beta notebooks instances create bqhook \
       --location=us-west1-a \
       --vm-image-family=tf-latest-cpu \
       --vm-image-project=deeplearning-platform-release \
       --machine-type=n1-standard-2
