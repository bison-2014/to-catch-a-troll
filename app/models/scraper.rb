class Scraper < ActiveRecord::Base	
  belongs_to :user

  def initiated_at
  	self.created_at.strftime("%F")
  end
end