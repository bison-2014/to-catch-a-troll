puts "*" * 80
puts "REDIS INIT CALLED"
puts "*" * 80

uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
# REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Resque.redis = ENV['REDISTOGO_URL']
