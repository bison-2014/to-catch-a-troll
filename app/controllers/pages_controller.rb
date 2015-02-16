class PagesController < ApplicationController

# before_action :authenticate_user!

  def search
    user = current_user
    params[:search] = user.search_query.search_query if user.search_query

    if params[:search].blank?
      render 'search'
    end

    if Page.count > 0
      @usersearch = Page.search do
        fulltext params[:search] do
          highlight :body
        end
      end
      @results_found = @usersearch.hits
    else
      @message = "Start your first search"
    end
  end

end
