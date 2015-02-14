class User < ActiveRecord::Base
  has_many :inquiries

  has_secure_password
end