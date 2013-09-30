Beeline::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = false

  # In production, :host should be set to the actual host of your application.
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }


  # allows setup of non-pushed yaml file: /config/amazon_s3_local.yml
  # this keeps keys off of github
  # currently mimics production bucket, no real reason to use different ones right away
  APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../amazon_s3_local.yml', __FILE__))))

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => APP_CONFIG['AWS_BUCKET'],
      :access_key_id => APP_CONFIG['AWS_ACCESS_KEY_ID'],
      :secret_access_key => APP_CONFIG['AWS_SECRET_ACCESS_KEY']
    }
  }
end
