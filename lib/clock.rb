require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

every(12.hour, 'resque.enqueue'){ Resque.enqueue(TaskWorker, 1)}
every(12.hour, 'resque.enqueue'){ Resque.enqueue(TaskWorker, 2)}
#   every(10.seconds, 'taskworker.perform'){ Taskworker.perform(1) }
#   # every(3.minutes, 'less.frequent.job')
#   # every(1.hour, 'hourly.job')

#   # every(1.day, 'midnight.job', :at => '00:00')
end
