class TaskWorker
  @queue = :task_queue

  def self.perform(query_id)
    query = Query.find(query_id)
    page = cobweb.get(:url)
    file = File.open("output.html", "wb") { |f| f.write(page[:body]) }
    query.update_attributes(response: File.absolute_path(file))
  end

end