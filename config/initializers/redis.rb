<<<<<<< HEAD

uri = URI.parse(ENV["REDISTOGO_URL"])
<<<<<<< HEAD
<<<<<<< HEAD
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)
=======
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
>>>>>>> e67445f... added redis addon to heroku
=======
# REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis = REDIS
>>>>>>> e879898... changed redis setting in redis.rb
=======
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
# REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis = REDIS
>>>>>>> 52e911c... set heroku config REDIS_PROVIDER
