require 'spec_helper'
# require 'custom_crawler'

xdescribe "CustomCrawler" do
  describe ".recursive_get" do
    let (:url)        { "http://www.example.com" }
    let (:cw)         { Cobweb.new }
    let (:body)       { cw.get(url)[:body] }
    let (:ccrawler)   { CustomCrawler.new }
    let (:page_count) { Page.all.count }

    it "increases the number of page objects by 1" do
      ccrawler.get(url, 0)
      expect (Page.all.count).to eq(page_count + 1)
    end

    it "retrieves the correct body" do
      ccrawler.get(url, 0)
      expect (Page.last[:body]).to eq(body)
    end
  end
end