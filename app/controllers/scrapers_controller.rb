class ScrapersController < ApplicationController

  before_action :authenticate_user!

  def index
    @scrapers = Scraper.all
  end

  def new
    @targets = Target.all
  end

  def create
    @target = Target.find(target_params)
    @scraper = Scraper.create(target: @target, url: @target.base_url)

    Resque.enqueue(TaskWorker, @target.id)

    redirect_to scrapers_path
  end


  private

  def scraper_params
    params.require(:scraper).permit(:url)
  end

  def target_params
    params.require(:target)
  end

end
