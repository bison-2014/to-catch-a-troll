class ScrapersController < ApplicationController

  # before_action :authenticate_user!

  def index
    @scrapers = Scraper.all
  end

  def new
    @scraper = Scraper.new
  end

  def create
    @target = Target.find(1)
    @scraper = Scraper.create(scraper_params)

    Resque.enqueue(TaskWorker, @target.id)

    redirect_to scrapers_path
  end


  private

  def scraper_params
    params.require(:scraper).permit(:url, :id)
  end

end
