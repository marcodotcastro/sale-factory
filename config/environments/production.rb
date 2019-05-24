Rails.application.configure do

  # config.cache_classes = false
  # config.eager_load = false
  # config.consider_all_requests_local = true
  #
  # config.action_controller.perform_caching = true
  # config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  # config.assets.js_compressor = :uglifier
  # config.assets.compile = false
  # config.active_storage.service = :local
  # config.log_level = :debug
  # config.log_tags = [:request_id]
  # config.action_mailer.perform_caching = false
  # config.i18n.fallbacks = true
  # config.active_support.deprecation = :notify
  # config.log_formatter = ::Logger::Formatter.new
  #
  # if ENV["RAILS_LOG_TO_STDOUT"].present?
  #   logger = ActiveSupport::Logger.new(STDOUT)
  #   logger.formatter = config.log_formatter
  #   config.logger = ActiveSupport::TaggedLogging.new(logger)
  # end
  #
  # config.active_record.dump_schema_after_migration = false

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  config.active_storage.service = :amazon
  config.assets.debug = true
  config.assets.quiet = true

  config.action_mailer.smtp_settings = {
      address: "smtp.sendgrid.net",
      port: 587,
      domain: ENV["DOMAIN_NAME"],
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV["SENDGRID_USERNAME"],
      password: ENV["SENDGRID_PASSWORD"]
  }
  # ActionMailer Config
  config.action_mailer.default_url_options = {:host => ENV["DOMAIN_NAME"]}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false

end
