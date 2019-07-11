class Aws::S3Provider

  require 'aws-sdk-s3'


  def self.signed_request(prefix, filename, file_type='image/jpeg', limit=nil)
    puts "#{prefix}, #{filename}, #{file_type}"
    set_credentials
    object_key = Pathname.new(prefix).join(filename).to_s
    obj = @s3.bucket(Settings.s3.bucket).object(object_key)
    params = { acl: 'public-read', content_type: file_type }
    params[:content_length] = limit if limit

   ##returns pre-signed-url
   obj.presigned_url(:put, params)
  end

  def self.get_file_signed_request(prefix, filename)
    set_credentials
    object_key = Pathname.new(prefix).join(filename).to_s
    obj = @s3.bucket(Settings.s3.bucket).object(object_key)

    ##returns pre-signed-urltps://
    obj.presigned_url(:get)
  end

  def self.list_files(prefix)
    set_credentials

    ### return an array of filename found in a particular folder/prefix
    object_list = @s3.bucket(Settings.s3.bucket).objects(prefix: prefix, delimiter: '').collect(&:key)
    ### create public urls of returned objects
    object_list.map{|m| "https://#{Settings.s3.bucket}.s3.amazonaws.com/#{m}"}
  end

  def self.delete_file(prefix, filename)
    set_credentials
    object_key = Pathname.new(prefix).join(filename).to_s

    obj = @s3.bucket(Settings.s3.bucket).object(object_key).delete


    # ##returns pre-signed-url
    # obj.presigned_url(:delete)
  end

  private

  def self.set_credentials
    creds = Aws::Credentials.new(Settings.s3.key, Settings.s3.secret)
    @s3 = Aws::S3::Resource.new(region: Settings.s3.region, credentials: creds)
  end

end