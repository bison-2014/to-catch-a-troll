class PagesController < ApplicationController

  before_action :authenticate_user!

  def search
    @query = SearchQuery.find_by(user_id: current_user.id)
    user_terms = @query.search_array if @query

    @targets = []
    @targets << Target.find(1)
    @targets << Target.find(2)
    @targets << Target.find(188)

    @the_targets = []
    @the_targets = params[:target][:ids] if params[:target]

    @query = SearchQuery.find_by(user_id: current_user.id)
    user_terms = @query.search_array if @query

    if user_terms
      @usersearch = Page.search do
        with(:target_id).any_of(@the_targets) if @the_targets
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
