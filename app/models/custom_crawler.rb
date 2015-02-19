class CustomCrawler
  include ActionView::Helpers::SanitizeHelper

  def initialize(target_id )
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
    @target = Target.find_by(id: target_id)
  end

  def is_not_pic(my_link)
    ![".jpg", ".png", ".gif", ".tiff", ".swf"].any? {|extension| my_link[:base_url].include? (extension)}
  end

  def recursive_get(base_url, depth = 2)
    unless depth < 0
      begin
        file = @cw.get(base_url)
      rescue => e
        puts "a connection is refused, move on: ERROR #{e.inspect}"
      end

      begin
        raw_file = file[:body].force_encoding('utf-8')
      rescue => e
        puts "encoding failed: ERROR #{e.inspect}"
      end

      if (page = Page.find_by(base_url: base_url))
        page.destroy
      end

      if file && raw_file && file[:status_code] == 200 && is_not_pic(file)

        sanitized_file = sanitize(strip_tags(raw_file))
        if sanitized_file
          sanitized_file.gsub!(/[\t\n]+|[\s]{2,}/," ")
        end

        Page.create(base_url: base_url,
          raw_file: raw_file,
          body: sanitized_file,
          target_id: @target.id)
      end
      if file
        file[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
    nil
  end
end
