class ScrapersController < ApplicationController
before_action :authenticate_user!
  def index
    @scrapers = Scraper.all
  end

  def new
    @scraper = Scraper.new
  end

  def create
    website_url = scraper_params[:url]

    @scraper = Scraper.create(url: website_url)

    Resque.enqueue(TaskWorker, website_url)
    redirect_to scrapers_path
  end


  private

  def scraper_params
    params.require(:scraper).permit(:url, :id)
  end

end
