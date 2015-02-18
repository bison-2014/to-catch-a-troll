class CustomCrawler
  include ActionView::Helpers::SanitizeHelper

  def initialize(target_id )
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
    @target = Target.find_by(id: target_id)
  end

  def recursive_get(base_url, depth = 2)

    def is_not_pic(my_link)
      ![".jpg", ".png", ".gif", ".tiff", ".swf"].any? {|extension| my_link[:base_url].include? (extension)}
    end

    unless depth < 0
      if @target.sanitize_options
       options = eval(@target.sanitize_options)
      else
        options = { elements: ['div', 'p', 'span'] }
      end

      begin
        file = @cw.get(base_url)
      rescue => e
        puts "a connection is refused, move on: ERROR #{e.inspect}"
      end

      if page = Page.find_by(base_url: base_url)
        page.destroy
      end

      if file &&
        file[:status_code] == 200 &&
        is_not_pic(file)

        file[:body].force_encoding('iso-8859-1').encode('utf-8')

        sanitized_file = sanitize(strip_tags(file[:body]))
        sanitized_file.gsub!(/[\t\n]+/," ").gsub!(/[\s]{2,}/," ")

        Page.create(base_url: base_url, body: sanitized_file, target_id: @target.id)
        file[:links][:links].each { |link| recursive_get(link, depth-1) }
      end

    end
    nil
  end
end
