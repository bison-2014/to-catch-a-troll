class CustomCrawler
  def initialize
    @cw = Cobweb.new
  end

  def recursive_get(base_url, depth = 0)
    unless depth < 0
      f = @cw.get(base_url)
      f[:body].force_encoding('iso-8859-1').encode('utf-8')
      unless Page.find_by(base_url: base_url)
        Page.create(base_url: base_url, body: f[:body])
        f[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
  end

  #   def recursive_get(base_url, depth = 0)
  #   unless depth < 0
  #     f = @cw.get(base_url)
  #     Page.create(base_url: base_url, body: f[:body])
  #     f[:links][:links].each { |link| recursive_get(link, depth-1) }
  #   end
  # end

end
