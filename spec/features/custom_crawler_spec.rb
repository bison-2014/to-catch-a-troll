require 'spec_helper'
# require 'custom_crawler'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
xdescribe "CustomCrawler" do
=======
describe "CustomCrawler" do
>>>>>>> 740d45c... custom_crawler spec first commit
=======
describe "CustomCrawler" do
>>>>>>> 042fe0a... custom_crawler spec first commit
=======
describe "CustomCrawler" do
>>>>>>> b1d7c6f... custom_crawler spec first commit
  describe ".recursive_get" do
=======
xdescribe "CustomCrawler" do
<<<<<<< HEAD
  xdescribe ".recursive_get" do
>>>>>>> d034958... disabled custom crawler feature tests for now
=======
  describe ".recursive_get" do
>>>>>>> 904f946... also disable model tests for custom crawler
    let (:url)        { "http://www.example.com" }
    let (:cw)         { Cobweb.new }
    let (:body)       { cw.get(url)[:body] }
    let (:ccrawler)   { CustomCrawler.new }
    let (:page_count) { Page.all.count }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    it "increases the number of page objects by 1" do
=======
    xit "increases the number of page objects by 1" do
>>>>>>> 740d45c... custom_crawler spec first commit
=======
    xit "increases the number of page objects by 1" do
>>>>>>> 042fe0a... custom_crawler spec first commit
=======
    xit "increases the number of page objects by 1" do
>>>>>>> b1d7c6f... custom_crawler spec first commit
=======
    it "increases the number of page objects by 1" do
>>>>>>> 904f946... also disable model tests for custom crawler
      ccrawler.get(url, 0)
      expect (Page.all.count).to eq(page_count + 1)
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    it "retrieves the correct body" do
=======
    xit "retrieves the correct body" do
>>>>>>> 740d45c... custom_crawler spec first commit
=======
    xit "retrieves the correct body" do
>>>>>>> 042fe0a... custom_crawler spec first commit
=======
    xit "retrieves the correct body" do
>>>>>>> b1d7c6f... custom_crawler spec first commit
=======
    it "retrieves the correct body" do
>>>>>>> 904f946... also disable model tests for custom crawler
      ccrawler.get(url, 0)
      expect (Page.last[:body]).to eq(body)
    end
  end
end