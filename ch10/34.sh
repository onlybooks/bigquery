gcloud kms keyrings create acmecorp --location US
gcloud kms keys create xyz --location US \
  --keyring acmecorp --purpose encryption \
  --rotation-period 30d \
  --next-rotation-time 2019-07-01T12:00:00Z