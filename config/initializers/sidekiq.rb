require 'sidekiq/web'


Sidekiq.configure_server do |config|
  if ENV['HEROKU_REDIS_IVORY_TLS_URL'].present?
   config.redis = {url: ENV['HEROKU_REDIS_IVORY_TLS_URL'], ssl_params: {verify_mode: OpenSSL::SSL::VERIFY_NONE}}
  else
    config.redis = {url: 'redis://localhost:6379/0'}
  end
end

Sidekiq.configure_client do |config|
  if ENV['HEROKU_REDIS_IVORY_TLS_URL'].present?
    config.redis = {url: ENV['HEROKU_REDIS_IVORY_TLS_URL'], ssl_params: {verify_mode: OpenSSL::SSL::VERIFY_NONE}}
  else
    config.redis = {url: 'redis://localhost:6379/0'}
  end
end
