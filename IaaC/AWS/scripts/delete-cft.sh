#!/bin/bash

args=($1)
AWS_REGION=us-east-1


STACK_NAME= 
aws cloudformation delete-stack --stack-name $STACK_NAME
