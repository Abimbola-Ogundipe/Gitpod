aws s3api create-bucket --bucket s3-exampple --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1
aws s3 rm s3://s3-exampple  --recursive
   aws s3api delete-bucket --bucket s3-exampple
