require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
#puts bucket_name   confirm ruby is working

bucket_name = "my-bucket-#{rand(10000)}"

s3 = Aws::S3::Client.new(region: region)  #AWS sdk client configuration, dont need to set credentials because ruby automatically gets that froms the aws Installation

# 1. Create bucket
begin
  s3.create_bucket(
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region
    }
  )
  puts "Bucket created: #{bucket_name}"
rescue => e
  puts "Bucket creation failed: #{e.message}"
end

# Create a file locally
file_name = "hello.txt"
File.write(file_name, "Hello from Ruby S3")

# This will upload file
begin
  s3.put_object(
    bucket: bucket_name,
    key: file_name,
    body: File.read(file_name)
  )
  puts "File uploaded: #{file_name}"
rescue => e
  puts "Upload failed: #{e.message}"
end