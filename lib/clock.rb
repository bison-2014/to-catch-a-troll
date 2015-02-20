require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

every(8.hour, 'resque.enqueue'){ Resque.enqueue(TaskWorker, 1)}
every(8.hour, 'resque.enqueue'){ Resque.enqueue(TaskWorker, 2)}
every(8.hour, 'search.enqueue'){ Resque.enqueue(SearchWorker) }
end
