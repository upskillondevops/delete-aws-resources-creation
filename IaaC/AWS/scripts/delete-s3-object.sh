#!/bin/bash

args=($1)
AWS_REGION=us-east-1
SWAGGER_BUCKET=appmod-appcont-dev-swagger-bucket
echo -n "deleting files in S3 bucket $SWAGGER_BUCKET"
# Delete contents of the bucket
aws s3 rm s3://$SWAGGER_BUCKET --region $AWS_REGION --recursive
echo -n "deleting S3 bucket $SWAGGER_BUCKET"
# Delete the empty bucket
aws s3 rb s3://$SWAGGER_BUCKET --region $AWS_REGION
