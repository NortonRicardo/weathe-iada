# # require 'resque/server'
# #
# if Rails.env.development?
#   Resque.redis = Redis.new(host: 'localhost', port: '6379')
# else
#   REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
#   Resque.redis = REDIS
# end

# local_redis = ENV.fetch("REDIS_URL") if ENV["REDIS_URL"].present?

# if local_redis.present?
#   paramet
# else
#
# end


def conexao_redis()
  Sidekiq.configure_server do |config|
    config.redis = {url: 'redis://:pbc1ad979199760ed39137274b662c0623909839fe0d0312b29804ab496e3063b@ec2-54-159-210-48.compute-1.amazonaws.com:8110', password: 'pbc1ad979199760ed39137274b662c0623909839fe0d0312b29804ab496e3063b'}
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: 'redis://localhost:6379/0'}
  end
end

conexao_redis()