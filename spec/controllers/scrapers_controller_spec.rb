require 'rails_helper'

RSpec.describe ScrapersController, type: :controller do

	describe "GET #index" do
		xxit "lists all scrapers" do
			scraper = Scraper.create
      get :index
      expect(assigns(:scrapers)).to eq([scrapers])
		end

		xit "renders index template" do
			get :index
      expect(response).to render_template("index")
		end
	end

	describe "GET #new" do
		xit "renders new template" do
			get :new
      expect(response).to render_template("new")
		end

		xit "renders the actual template" do
      get :new
      expect(response.body).to have_content eq("Url")
    end
	end

	describe "POST #create" do
		xit "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

		it "redirects to GET #index" do
			get :index
      expect(response).to render_template("index")
		end

		xit "create a new scraper" do
			expect{ FactoryGirl.create :scraper }.to change{Scraper.all.count}.by 1
		end
	end

end