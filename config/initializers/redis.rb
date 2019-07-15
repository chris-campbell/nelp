require "redis"
redis_url = ENV.fetch("REDIS_URL")

REDIS = Redis.new(url: redis_url)
