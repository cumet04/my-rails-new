Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.public_file_server.enabled = true

  config.consider_all_requests_local = true
  BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  config.session_options[:secure] = false

  config.log_level = :debug
  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_record.dump_schema_after_migration = true
end
