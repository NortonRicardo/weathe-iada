require 'sidekiq/web'


Sidekiq.configure_server do |config|
   config.redis = {url: ENV['HEROKU_REDIS_IVORY_TLS_URL'], ssl_params: {verify_mode: false}}
   # config.redis = {url: 'redis://localhost:6379/0'}
end

Sidekiq.configure_client do |config|
  # config.redis = {url: 'redis://localhost:6379/0'}
  config.redis = {url: ENV['HEROKU_REDIS_IVORY_TLS_URL'], ssl_params: {verify_mode: false}}
end
