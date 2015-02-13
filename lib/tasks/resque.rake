require "resque.rake"

task "resque:setup" => :environment

#This will do but think about implementing something lighter

=begin
Next step: go to controller and type

Resque.enqueue(task, arg)

in the relevant controller
=end