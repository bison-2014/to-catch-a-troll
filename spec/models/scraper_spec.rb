require 'rails_helper'

RSpec.describe Scraper, type: :model do

	let(:scraper) { FactoryGirl.build_stubbed(url: "http://www.google.com", updated_at: "2015-02-15 23:08:43 -0600") }
	let(:no_url_scraper) { FactoryGirl.build(url: nil) }

	xit "is valid with an url" do
		expect(scraper).to be_valid
	end

	xit "is invalid without an url" do
		expect(no_url_scraper).to_not be_valid
	end

	xit "has initiated date" do
		expect(scraper.initiated_at).to eq("2015-02-15")
	end

end
