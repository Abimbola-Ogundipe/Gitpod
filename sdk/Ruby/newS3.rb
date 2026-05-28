require 'aws-sdk-s3'


bucket_name = ENV['BUCKET_NAME']  #added the bucket name as environmental variable
region = 'eu-north-1' 

s3 = Aws::S3::Client.new(region: region)

# create file locally
file_name = "hello.txt"
File.write(file_name, "Hello from Ruby S3")

# first I did is to upload the file
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

# delete all objects in bucket
begin
  objects = s3.list_objects_v2(bucket: bucket_name)

  objects.contents.each do |obj|
    s3.delete_object(
      bucket: bucket_name,
      key: obj.key
    )

    puts "Deleted #{obj.key}"
  end

rescue => e
  puts "Object delete failed: #{e.message}"
end

# delete bucket
begin
  s3.delete_bucket(bucket: bucket_name)

  puts "Deleted bucket: #{bucket_name}"

rescue => e
  puts "Bucket delete failed: #{e.message}"
end