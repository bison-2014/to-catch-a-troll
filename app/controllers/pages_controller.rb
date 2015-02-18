class PagesController < ApplicationController

  before_action :authenticate_user!

  def search
    # @query = SearchQuery.find_by(user_id: current_user.id)
    # user_terms = @query.search_array if @query

    @targets = []
    @targets = params[:target][:ids] if params[:target]

    # if user_terms
    #   @usersearch = Page.search do
    #     with(:target_id).any_of(@targets) if @targets
    #     fulltext user_terms do
    #       highlight :body
    #     end
    #   end
    searcher = UserPageSearch.new(user: current_user)

    @usersearch = searcher.search(@targets)

    if @usersearch
      @results_found = @usersearch.hits
    else
      @message = "No results found"
    end

    @query = searcher.query
  end

end
