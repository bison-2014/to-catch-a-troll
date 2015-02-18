class Scraper < ActiveRecord::Base
  belongs_to :user
  belongs_to :target

  validates :url, presence: true

  def initiated_at
  	self.created_at.strftime("%F")
  end
end
