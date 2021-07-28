#!/bin/bash
set -ex

AWS_REGION="ap-south-1"


echo "Access keys:: ${aws_access_key}"
echo "access keys donee:"


ARTIFACT=`packer build -machine-readable build/packer-demo.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'`
echo "packer output:"
cat build/packer-demo.json

packer build -machine-readable build/packer-demo.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'

AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo "AMI ID: ${AMI_ID}"

echo "writing amivar.tf and uploading it to s3"
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
S3_BUCKET=`aws s3 ls --region $AWS_REGION |grep terraform-state |tail -n1 |cut -d ' ' -f3`
aws s3 cp amivar.tf s3://${S3_BUCKET}/amivar.tf --region $AWS_REGION
