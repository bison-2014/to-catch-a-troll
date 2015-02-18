class FlagsController < ApplicationController

  def create
    page = Page.find(params[:'hit-number'])
    flag = Flag.create(user: current_user,
                  highlight: params[:highlight],
                        url: params[:url],
                      score: params[:score].to_f)
  end

  def index
    @flags = Flag.where(user:current_user).order(created_at: :desc)
  end
end
