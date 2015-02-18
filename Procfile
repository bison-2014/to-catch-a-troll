web: bundle exec rails server -p $PORT -e $RAILS_ENV
worker: bundle exec rake resque:work QUEUE='*'

clock: bundle exec clockwork lib/clock.rb
