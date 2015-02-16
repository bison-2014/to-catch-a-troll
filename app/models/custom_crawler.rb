class CustomCrawler
  require 'digest/md5'

  def initialize
    option_hash = { crawl_limit_by_page: true }
    @cw = Cobweb.new(option_hash)
  end

  def recursive_get(base_url, depth = 2)
    unless depth < 0
      begin
        f = @cw.get(base_url)
      rescue
        puts "a connection was refused, move on"
      end
      if f && f[:status_code] == 200
        f[:body].force_encoding('iso-8859-1').encode('utf-8')
        checksum = Digest::MD5.hexdigest(f[:body].to_s)
        Page.create(base_url: base_url, body: f[:body], checksum: checksum) unless Page.find_by(base_url: base_url)
        f[:links][:links].each { |link| recursive_get(link, depth-1) }
      end
    end
    nil
  end
end
