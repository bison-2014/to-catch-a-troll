class PagesController < ApplicationController

before_action :authenticate_user!

  def search
    if params[:search].blank?
      flash[:notice] = "Please enter valid keywords"
      render 'search'
    end
    @usersearch = Page.search do
      fulltext params[:search]
    end
    @results_found = @usersearch.results
  end

end
