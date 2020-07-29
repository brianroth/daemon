require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST')}:#{ENV.fetch('REDIS_PORT') || 6379}/12" , size: 1 }
end

require 'sidekiq/web'
require 'sidekiq/cron/web'
run Sidekiq::Web