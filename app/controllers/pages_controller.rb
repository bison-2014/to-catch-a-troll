class PagesController < ApplicationController

before_action :authenticate_user!

  def search
  @query = SearchQuery.find_by(user_id: current_user.id)
  term = @query.search_string if @query

    if term
      @usersearch = Page.search do
        fulltext term do
          highlight :body
        end
      end
      @results_found = @usersearch.hits
    else
      @message = "No results found"
    end
  end

end