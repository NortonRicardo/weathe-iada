require 'sidekiq/web'


Sidekiq.configure_server do |config|
   config.redis = {url: 'redis://:p07d22f609e3e0441aa5c588e9bc817f042bdf5a49e99284fac29436e3491004d@ec2-184-72-149-26.compute-1.amazonaws.com:11980', ssl_params: {verify_mode: false}}
   # config.redis = {url: 'redis://localhost:6379/0'}
end

Sidekiq.configure_client do |config|
  # config.redis = {url: 'redis://localhost:6379/0'}
  config.redis = {url: 'redis://:p07d22f609e3e0441aa5c588e9bc817f042bdf5a49e99284fac29436e3491004d@ec2-184-72-149-26.compute-1.amazonaws.com:11980', ssl_params: {verify_mode: false}}
end
