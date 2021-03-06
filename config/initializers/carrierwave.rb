# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV["S3_KEY"],
    :aws_secret_access_key => ENV["SECRET_KEY"],
    :region                => ENV["REGION"]
  }

  config.fog_use_ssl_for_aws = false
  config.fog_directory    = "finditiobucket"
  # config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  # config.fog_host         = "#{ENV['https://console.aws.amazon.com/s3/home']}/#{ENV['finditiobucket']}"
end
