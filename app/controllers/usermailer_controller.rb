class UsermailerController < ApplicationController
 
  def index

  end
  
  def create
    Usermailer.gmail_message.deliver_now
    flash[:notice]= "Sent"
    redirect_to "/home"
  end

end
