class PagesController < ApplicationController

  before_action :authenticate_user!

  def search
    @all_targets = [Target.find(1), Target.find(2), Target.find(188)]

    @targets = []
    @targets = params[:target][:ids] if params[:target]

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
