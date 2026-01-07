#!/bin/bash

#######################

# Author: Edun Mukhtar
# Date: 6th-Jan-2025
#
# Version:v1
#
# This script will report all resource usage.
#############################

# Resources to Track
# Ec2
# S3
# Lambda
# IAM Users
############################
set -x # debug Mode
set  -e 
set -o pipefail


# list Ec2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list S3 buckets
aws s3 ls

# list lambda functions
aws lambda list-functions

# list IAM Users
aws iam list-users | jq '.Users[] | {UserName, UserId, CreateDate}'