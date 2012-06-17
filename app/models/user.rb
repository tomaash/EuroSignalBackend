class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :login, :password, :password_confirmation
  acts_as_authentic
  has_many :locations
end
