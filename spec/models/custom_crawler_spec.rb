require 'rails_helper'
# require 'custom_crawler'

describe "CustomCrawler" do
  @body = <<HTML
  <html><div>Foo</div>
  <div><a href="http://www.other%20example.com/troll2">Bar</a></div>
  </html>
HTML

  before(:each) do
    @ccrawler = CustomCrawler.new(1)
    FakeWeb.register_uri(:any, "http://example.com/troll1", body: @body)
    FakeWeb.register_uri(:any, "http://other%20example.com/troll2", body: "Quxxxx")
  end

  describe "#initialize" do
    xit "creates a new Cobweb object with crawl_limit_by_page option set to true" do

    end
  end

  describe "#recursive_get" do
    xit "retrieves the body associated with the base url" do
      @ccrawler.recursive_get("http://example.com/troll1", 0)
      expect (Page.last)[:body].to eq(body)
    end

    xit "retrieves the body of the linked url" do
      @ccrawler.recursive_get("http://example.com/troll1", 1)
      expect (Page.last)[:body].to eq("Quxxxx")
    end
  end

end