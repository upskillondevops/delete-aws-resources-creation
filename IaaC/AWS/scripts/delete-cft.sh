#!/bin/bash

# Define the AWS region
AWS_REGION="us-east-1"

# Define an array of CloudFormation stack names
stack_names=("APPMOD-APPCONT-s3" )

# Iterate over the array and delete each stack
for stack_name in "${stack_names[@]}"; do
    echo "Deleting stack: $stack_name"

    # Delete the CloudFormation stack
    aws cloudformation delete-stack --stack-name "$stack_name"

    # Optionally, wait for the deletion to complete
    if aws cloudformation wait stack-delete-complete --stack-name "$stack_name"; then
        echo "Stack deleted successfully: $stack_name"
    else
        # Print more information about the stack status
        aws cloudformation describe-stacks --stack-name "$stack_name" --query "Stacks[0].StackStatus"
        echo "Failed to delete stack: $stack_name"
    fi
done

echo "All stacks deletion attempts completed."
