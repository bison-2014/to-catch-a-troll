<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> upstream/master
require 'rails_helper'
# require 'custom_crawler'

describe "CustomCrawler" do
  @body = <<HEEJIN
  <html><div>Foo</div>
  <div><a href="http://www.other%20example.com/troll2">Bar</a></div>
  </html>
HEEJIN

  before(:each) do
    @ccrawler = CustomCrawler.new
    FakeWeb.register_uri(:any, "http://example.com/troll1", body: @body)
    FakeWeb.register_uri(:any, "http://other%20example.com/troll2", body: "Quxxxx")
  end

  describe "#initialize" do
    xit "creates a new Cobweb object with crawl_limit_by_page option set to true" do

    end
  end

  describe "#recursive_get" do
    xit "retrieves the body associated with the base url" do
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> upstream/master
      @ccrawler.recursive_get("http://example.com/troll1", 0)
      expect (Page.last)[:body].to eq(body)
    end

    xit "retrieves the body of the linked url" do
      @ccrawler.recursive_get("http://example.com/troll1", 0)
      expect (Page.last)[:body].to eq("Quxxxx")
    end
  end

  # describe "#recursive_get" do
  #   let (:url)        { "http://www.example.com" }
  #   let (:cw)         { Cobweb.new }
  #   let (:body)       { cw.get(url)[:body] }
  #   let (:ccrawler)   { CustomCrawler.new }
  #   let (:page_count) { Page.all.count }

  #   it "increases the number of page objects by 1" do
  #     ccrawler.get(url, 0)
  #     expect (Page.all.count).to eq(page_count + 1)
  #   end

  #   it "retrieves the correct body" do
  #     ccrawler.get(url, 0)
  #     expect (Page.last[:body]).to eq(body)
  #   end
  # end
<<<<<<< HEAD
=======
require 'spec_helper'
=======
require 'rails_helper'
>>>>>>> 4d040ac... resolved conflict
# require 'custom_crawler'

describe "CustomCrawler" do
  @body = <<HEEJIN
  <html><div>Foo</div>
  <div><a href="http://www.other%20example.com/troll2">Bar</a></div>
  </html>
HEEJIN

  before(:each) do
    @ccrawler = CustomCrawler.new
    FakeWeb.register_uri(:any, "http://example.com/troll1", body: @body)
    FakeWeb.register_uri(:any, "http://other%20example.com/troll2", body: "Quxxxx")
  end

  describe "#initialize" do
    xit "creates a new Cobweb object with crawl_limit_by_page option set to true" do

    end
  end

  describe "#recursive_get" do
    it "retrieves the body associated with the base url" do
=======
>>>>>>> 449ca16... neutered the test
      @ccrawler.recursive_get("http://example.com/troll1", 0)
      expect (Page.last)[:body].to eq(body)
    end

    xit "retrieves the body of the linked url" do
      @ccrawler.recursive_get("http://example.com/troll1", 0)
      expect (Page.last)[:body].to eq("Quxxxx")
    end
  end
<<<<<<< HEAD
>>>>>>> 15c2efe... custom_crawler spec first commit
=======

  # describe "#recursive_get" do
  #   let (:url)        { "http://www.example.com" }
  #   let (:cw)         { Cobweb.new }
  #   let (:body)       { cw.get(url)[:body] }
  #   let (:ccrawler)   { CustomCrawler.new }
  #   let (:page_count) { Page.all.count }

  #   it "increases the number of page objects by 1" do
  #     ccrawler.get(url, 0)
  #     expect (Page.all.count).to eq(page_count + 1)
  #   end

  #   it "retrieves the correct body" do
  #     ccrawler.get(url, 0)
  #     expect (Page.last[:body]).to eq(body)
  #   end
  # end
>>>>>>> 4d040ac... resolved conflict
=======
>>>>>>> upstream/master
end