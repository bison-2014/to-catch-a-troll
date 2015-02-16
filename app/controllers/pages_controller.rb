class PagesController < ApplicationController

# before_action :authenticate_user!

def search
  if Page.count > 0
    @usersearch = Page.search do
    if params[:search].blank?
      flash[:notice] = "Please enter valid keywords"
      render 'search'
    end
      fulltext params[:search]
        # highlight :body
    end
    @results_found = @usersearch.hits
  else
    @message = "Start your first search"
  end
end

end
