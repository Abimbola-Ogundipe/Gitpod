require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
#puts bucket_name   confirm ruby is working

s3 = Aws::S3::Client.new(   #AWS sdk client configuration, dont need to set credentials because ruby automatically gets that froms the aws installation
  region: 'eu-north-1'
)
resp = s3.list_buckets

resp.buckets.each do |b|
  puts b.name
 end
