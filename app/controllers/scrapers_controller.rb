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
puts @target.base_url
    @scraper = Scraper.create(scraper_params)
puts @scraper.url
    Resque.enqueue(TaskWorker, @target.id)
puts "Resque.enqueue called"
    redirect_to scrapers_path
  end


  private

  def scraper_params
    params.require(:scraper).permit(:url, :id)
  end

end
