class TaskWorker
  @queue = :task_queue

  def self.perform(inquiry_id)
    cobweb = Cobweb.new
    inquiry = Inquiry.find(inquiry_id)
    page = cobweb.get(:url)
    Page.create(title: page.title, body: page[:body])
    file = File.open("output.html", "wb") { |f| f.write(page.body) }
    inquiry.update_attributes(response: File.absolute_path(file))
  end

end