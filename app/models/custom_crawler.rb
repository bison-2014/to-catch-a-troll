class CustomCrawler
  include ActionView::Helpers::SanitizeHelper

  def initialize(target_id)
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
    @target = Target.find_by(id: target_id)
  end

  def is_not_pic(my_link)
    ![".jpg", ".png", ".gif", ".tiff", ".swf", "javascript"].any? {|extension| my_link[:base_url].include? (extension)}
  end

  def full_path(link)
    result = case
    when (link.start_with?("http") || link.include?("www."))
      link
    when link.start_with?("//")
      ("http:") + link
    when (@target.base_url.end_with?("/") && link.start_with?("/"))
      @target.base_url + link[1..-1]
    when (@target.base_url.end_with?("/") && link.start_with?("./"))
      @target.base_url + link[2..-1]
    else
      @target.base_url + link
    end
    result
  end

  def recursive_get(base_url, depth = 2)
    unless depth < 0
      begin
        file = @cw.get(base_url)
        raw_file = file[:body].force_encoding('UTF-8')
      rescue => e
        puts "move on: ERROR #{e.inspect}"
      end

      if (page = Page.find_by(base_url: base_url))
        page.destroy
      end

      if file && raw_file && file[:status_code] == 200 && is_not_pic(file)

        sanitized_file = strip_tags(sanitize(raw_file))
        if sanitized_file
          sanitized_file.gsub!(/[\t\n]+|[\s]{2,}/," ")
        end

        Page.create(base_url: base_url,
          raw_file: raw_file,
          body: sanitized_file,
          target_id: @target.id)
      end
      if file
        file[:links][:links].each { |link| recursive_get(full_path(link), depth-1) }
      end
    end
    nil
  end

  def get_4chan
    ["a", "b", "c", "d", "e", "f", "g", "gif", "h", "hr", "k", "m", "o", "p", "r", "s", "t", "u", "v", "vg", "vr", "w", "wg", "i", "ic", "r9k", "s4s", "cm", "hm", "lgbt", "y", "3", "adv", "an", "asp", "biz", "cgl", "ck", "co", "diy", "fa", "fit", "gd", "hc", "int", "jp", "lit", "mlp", "mu", "n", "out", "po", "pol", "sci", "soc", "sp", "tg", "toy", "trv", "tv", "vp", "wsg", "x"].each do |subd|
      recursive_get("http://www.4chan.org/" + subd + "/", 0)
      (2..10).each do |page|
        recursive_get("http://www.4chan.org/" + subd + "/" + page.to_s, 0)
      end
    end
  end

end