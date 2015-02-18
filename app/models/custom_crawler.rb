class CustomCrawler
  require 'digest/md5'

  def initialize(target_id)
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
    @target = Target.find(target_id)
puts @target.default_depth
  end

  def recursive_get(base_url, depth = 2)
    unless depth < 0
      options = @target.sanitize_options
puts depth
      begin
        f = @cw.get(base_url)
      rescue
        puts "a connection was refused, move on"
      end
      if page = Page.find_by(base_url: base_url)
        page.destroy
      end
      if f && f[:status_code] == 200 && ![".jpg", ".png", ".gif", ".tiff", ".swf"].any? {|extension| f[:base_url].include? (extension)}
        puts "inside conditional"
        f[:body].force_encoding('iso-8859-1').encode('utf-8')
        # sanitized_file = Sanitize.document(f[:body], options)
        # Page.create(base_url: base_url, body: sanitized_file, target_id: @target.id)

        Page.create(base_url: base_url, body: f[:body], target_id: @target.id)
        f[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
    nil
  end

end
