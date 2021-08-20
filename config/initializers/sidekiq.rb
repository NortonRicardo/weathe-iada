# # require 'resque/server'
# #
# # if Rails.env.development?
# #   Resque.redis = Redis.new(host: 'localhost', port: '6379')
# # else
#   uri = URI.parse(ENV['REDIS_URL'])
#   REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
#   Resque.redis = REDIS
# # end

local_redis = ENV.fetch("REDIS_URL") if ENV["REDIS_URL"].present?

if local_redis.present?
  parametros = {url: local_redis, password: 'redis'}
else
  parametros = {url: 'redis://localhost:6379/0'}
end


def conexao_redis(parametros)
  Sidekiq.configure_server do |config|
    config.redis = parametros
  end

  Sidekiq.configure_client do |config|
    config.redis = parametros
  end
end

conexao_redis(parametros)