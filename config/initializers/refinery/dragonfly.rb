# encoding: utf-8
Refinery::Dragonfly.configure do |config|

  # Should set this if concerned about DOS attacks. See
  # http://markevans.github.com/dragonfly/file.Configuration.html#Configuration

  # config.secret       = <%= Refinery::Dragonfly.secret.inspect %>
  # config.verify_urls  = <%= Refinery::Dragonfly.verify_urls.inspect %>

  # Refinery passes all options to Dragonfly. See refinerycms/dragonfly/lib/refinery/dragonfly/configuration.rb and
  # http://markevans.github.com/dragonfly/file.Configuration.html#Configuration

  # config.url_format           = nil
  # config.url_host             = nil
  # config.url_path_prefix      = nil

  # config.allow_legacy_urls    = nil
  # config.analysers            = nil
  # config.before_serve         = nil
  # config.datastore_root_path  = nil
  # config.define_url           = nil
  # config.dragonfly_url        = nil
  # config.fetch_file_whitelist = nil
  # config.fetch_url_whitelist  = nil
  # config.generators           = nil
  # config.mime_types           = nil
  # config.name                 = nil
  # config.path_prefix          = nil
  # config.plugin               = nil
  # config.processors           = nil
  # config.response_header      = nil


  # Set the S3 options using means other than securely by environment variables.
  # If you have to.
  config.s3_bucket_name = Settings.s3.bucket
  config.s3_access_key_id = Settings.s3.key
  config.s3_secret_access_key = Settings.s3.secret
  config.s3_region = Settings.s3.region

  # When true will use Amazon's Simple Storage Service instead of the default file system for storing resources and images
  config.s3_datastore = config.s3_access_key_id.present? || config.s3_secret_access_key.present?

  config.s3_fog_storage_options =  {path_style: true}
  # config.s3_root_path           = nil
  # config.s3_storage_path        = nil
  # config.s3_storage_headers     = nil
  # config.s3_url_host            = nil
  # config.s3_url_scheme          = nil
  # config.s3_use_iam_profile     = nil

  # Configure a custom Dragonfly datastore instead of the default (filesystem).
  # Dragonfly offers gems for datastores on S3, Couch, Mongo
  # See http://markevans.github.io/dragonfly/data-stores#building-a-custom-data-store
  #
  # config.custom_datastore_class = nil
  # config.custom_datastore_opts  = nil

end