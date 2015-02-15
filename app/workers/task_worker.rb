class TaskWorker
  @queue = :task_queue

  def self.perform(page_url)
    custom_crawler = CustomCrawler.new
    custom_crawler.recursive_get(page_url)
  end

end