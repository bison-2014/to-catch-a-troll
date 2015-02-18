class UsermailerController < ApplicationController
  def create
  end

  def index
    Notifier.deliver_gmail_message
    flash[:notice]=“sent”
    redirect_to root_path
  end
end
