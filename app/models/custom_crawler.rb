class CustomCrawler
  require 'digest/md5'

  def initialize
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  def recursive_get(base_url, depth = 0)
=======
  def recursive_get(base_url, depth = 2)
=======
  def recursive_get(base_url, depth = 2, options_hash)
>>>>>>> 863e81e... merge conflict resolved in app.models/target.rb
    target = Target.find_by(base_url: base_url)
<<<<<<< HEAD
>>>>>>> dfcf42e... models changes to incorporate target table logic in custom_crawler & user
=======
>>>>>>> 19607c2... models changes to incorporate target table logic in custom_crawler & user
=======
  def recursive_get(base_url, depth = 2)
<<<<<<< HEAD
    options = if (target = Target.find_by(base_url: base_url))
      eval(target.options)
    else
      elements: ["html", "div", "p", "span"]
    end
>>>>>>> a5ad763... crawler has target
=======
>>>>>>> 75d47a9... custom_crawler model clean
    unless depth < 0
      if (target = Target.find_by(base_url: base_url))
        options = eval(target.sanitize_options)
      else
        options = { elements: ["html", "div", "p", "span"] }
      end
      begin
        f = @cw.get(base_url)
      rescue => e
        puts "a connection was refused, move on: ERROR: #{e.inspect}"
      end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      if f && f[:status_code] == 200 #&& !f.is_image?
=======
      if f && f[:status_code] == 200 && !f.is_image?
>>>>>>> 3b72cdc... craigslisthelp
=======
      if f && f[:status_code] == 200 #&& !f.is_image?
>>>>>>> 05660ad... commented out stub of image filter
=======
      Page.find_by(base_url: base_url).destroy
      if f
        && f[:status_code] == 200
        && ![".jpg", ".png", ".gif"].any? {|extension| f[:base_url].include? (extension)}
>>>>>>> 863e81e... merge conflict resolved in app.models/target.rb
=======
      if page = Page.find_by(base_url: base_url)
        page.destroy
      end
<<<<<<< HEAD
      if f && f[:status_code] == 200 && ![".jpg", ".png", ".gif"].any? {|extension| f[:base_url].include? (extension)}
>>>>>>> a5ad763... crawler has target
=======
      if f
        && f[:status_code] == 200
<<<<<<< HEAD
        && ![".jpg", ".png", ".gif"].any? {|extension| f[:base_url].include? (extension)}
>>>>>>> 019ad1c... custom_crawler model clean
=======
        && ![".jpg", ".png", ".gif", ".tiff", ".swf"].any? {|extension| f[:base_url].include? (extension)}
>>>>>>> 75d47a9... custom_crawler model clean
        f[:body].force_encoding('iso-8859-1').encode('utf-8')
        sanitized_file = Sanitize.document(f[:body], options_hash)
        Page.create(base_url: base_url, body: sanitized_file, target_id: target.id)
        f[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
    nil
  end
<<<<<<< HEAD
end
=======

end
>>>>>>> 75d47a9... custom_crawler model clean
