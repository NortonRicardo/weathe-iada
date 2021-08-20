require 'sidekiq/web'


  Sidekiq.configure_server do |config|
    config.redis = {url: 'redis://:pbc1ad979199760ed39137274b662c0623909839fe0d0312b29804ab496e3063b@ec2-54-159-210-48.compute-1.amazonaws.com:8110'}
  end

  Sidekiq.configure_client do |config|
    # config.redis = {url: 'redis://localhost:6379/0'}
    config.redis = {url: 'redis://:pbc1ad979199760ed39137274b662c0623909839fe0d0312b29804ab496e3063b@ec2-54-159-210-48.compute-1.amazonaws.com:8110'}
  end
