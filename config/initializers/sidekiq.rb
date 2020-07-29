Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST')}:#{ENV.fetch('REDIS_PORT') || 6379}/12" }
  Sidekiq::Cron::Job.load_from_hash YAML.load_file('config/schedule.yml')
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST')}:#{ENV.fetch('REDIS_PORT') || 6379}/12" }
end
