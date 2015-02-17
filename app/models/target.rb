class Target < ActiveRecord::Base
  belongs_to :user
  has_many :pages

end
