class TaskWorker
  @queue = :task_queue

  def self.perform(task_id)
    # code from controller goes here and thus moves to the background
  end

end