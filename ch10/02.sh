PROJECT=$(gcloud config get-value project)
gcloud iam roles create dataSupplier --project $PROJECT \
  --file dataSupplier.yaml