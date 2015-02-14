class CustomCrawler
  def initialize
    @cw = Cobweb.new
  end

  def recursive_get(base_url, depth = 0)
    unless depth < 0
      begin
        f = @cw.get(base_url)
      rescue
        puts "a connection was refused, move on"
      end
      if f && f[:status_code] == 200
        f[:body].force_encoding('iso-8859-1').encode('utf-8')
        Page.create(base_url: base_url, body: f[:body]) unless Page.find_by(base_url: base_url)
        f[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
  end
end
