class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # POST /pages
  # POST /pages.json
  def create
    page_url = page_params[:base_url]
    
    # if page_url.valid?
      Resque.enqueue(TaskWorker, page_url)
     redirect_to '/'  #@page, notice:"Scraping Website"
    # else
    #   flash[:errors] = "oopsies"
    #   redirect_to :back
    # end
  end

  # PATCH/PUT /pages/1
  def update
    respond_to do |format|
      if @page.update(page_params)
      
      else
        
      end
    end
  end

  def show
    # @page = Page.find(page_params)
    @message = "YOU ENTERED URL"
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:base_url, :id)
    end
end
