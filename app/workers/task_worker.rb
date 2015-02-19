class TaskWorker
  @queue = :task_queue

  def self.perform(target_id)
    target = Target.find_by(id: target_id)
    custom_crawler = CustomCrawler.new(target_id)
    if target_id == 1
      custom_crawler.get_4chan
    else
      custom_crawler.recursive_get(target.base_url, target.default_depth)
    end
  end

end
