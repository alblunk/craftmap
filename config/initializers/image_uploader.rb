# allows setup of non-pushed yaml file: /config/amazon_s3_local.yml
# this keeps keys off of github
# currently mimics production bucket, no real reason to use different ones right away
require 'carrierwave'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],     # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'], # required
    # :region => 'us-west-2', # commenting this out fixed things
    # :host => 's3.example.com', # optional, defaults to nil
    # :endpoint => 'https://s3.example.com:8080' # this didn't do anything # optional, defaults to nil
  }
  # config.fog_host       = 'https://us-west-2.amazonaws.com/beelineco' # this didn't do anything
  config.fog_directory  = ENV['AWS_BUCKET']  # required
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  if Rails.env.test?
    config.storage = :file # local
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp" # is deleted
  else
    config.storage = :fog # push to s3
  end
end


# config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku


# notes from our senior engineer at Wantful about s3:
# 1) generate a SHA of the contents and include that in the name of the image
# 2) Set the s3 folder to public but don't serve out of that folder, serve out of cloud front
# 3) Set the expiry on the image to very far future


# this way the files are cached in the user's browser
# and never pull from the server again
# if you need to update them, they change and you get a new hash
# this makes your bandwidth VERY small, makes your site VERY fast
# but it means you have to maintain a list of SHAs for every image to always refer to the latest… which is a pain
# but it is worth it
# paperclip should have a lot of that built in

# So you should have something like ProductImage and have a sha field on it or have that right on the product, I don't know how you store those



# [10/1/13 10:57:26 AM]
# Matt Freeman: do we have a cloud front account set up?
# Alex Blunk: nope, set one up firing to support@farallon.co, just let me know what the pass is