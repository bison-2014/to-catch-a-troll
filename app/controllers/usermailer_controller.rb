class UsermailerController < ApplicationController
 
  def index

  end
  
  def create
    Usermailer.deliver_gmail_message
    flash[:notice]= "Sent"
    redirect_to "/home"
  end

end
