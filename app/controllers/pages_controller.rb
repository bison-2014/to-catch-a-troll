class PagesController < ApplicationController

before_action :authenticate_user!

  def search
  @query = SearchQuery.find_by(user_id: current_user.id)
  user_terms = @query.search_array if @query
  the_target = params[:target].to_i
  puts the_target

    if user_terms
      @usersearch = Page.search do
        with(:target_id, the_target )
        fulltext user_terms do
          highlight :body
        end
      end
      @results_found = @usersearch.hits
    else
      @message = "No results found"
    end
  end

end