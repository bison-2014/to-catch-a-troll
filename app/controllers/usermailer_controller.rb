class UsermailerController < ApplicationController
 
  def index
    @user = User.find_by(id: current_user.id)
  end
  
  def create
    @user = User.find_by(id: current_user.id)
    Usermailer.gmail_message(@user).deliver_now
    flash[:notice]= "Sent"
    redirect_to "/home"
  end

end
