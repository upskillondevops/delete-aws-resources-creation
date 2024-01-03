#!/bin/bash

AWS_REGION="us-east-1"
BUCKET_NAME="appmod-appcont-dev-swagger-bucket"

# Delete all objects in the bucket
aws s3 rm "s3://${BUCKET_NAME}" --region "${AWS_REGION}" --recursive

# Wait for a short time to ensure all objects are deleted (optional)
sleep 5

# Delete all versions of objects in the bucket
# aws s3api list-object-versions --bucket "${BUCKET_NAME}" --region "${AWS_REGION}" \
#   --output json | jq -M '.Versions[] | {Key:.Key,VersionId:.VersionId}' | jq -s '.' | \
#   xargs -I {} aws s3api delete-object --bucket "${BUCKET_NAME}" --region "${AWS_REGION}" --delete "{}"

# Delete the empty bucket
aws s3api delete-bucket --bucket "${BUCKET_NAME}" --region "${AWS_REGION}"
