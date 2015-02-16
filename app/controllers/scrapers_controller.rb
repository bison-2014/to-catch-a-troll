class ScrapersController < ApplicationController

  # before_action :authenticate_user!

  def index
    @scrapers = Scraper.all
  end

  def new
    @scraper = Scraper.new
  end

  def create
    @scraper = Scraper.create(url: target.url)

    Resque.enqueue(TaskWorker, target.id)
    redirect_to scrapers_path
  end


  private

  def scraper_params
    params.require(:scraper).permit(:url, :id)
  end

end
