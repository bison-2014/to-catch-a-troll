Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password = ENV['SECRET']
<<<<<<< HEAD
<<<<<<< HEAD
end
=======
end

Resque.redis = REDIS
>>>>>>> 67a7a77... added Resque.redis = REDIS to resque_auth.rb
=======
end
>>>>>>> fcaa6fa... resolved conflict of Procfile
