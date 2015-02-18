class Target < ActiveRecord::Base
  belongs_to :user
  has_many :pages
  has_many :scrapers
end
