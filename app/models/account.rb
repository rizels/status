class Account < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username
  has_secure_password
  validates :username, :presence => true, :length => {:minimum => 2}, :uniqueness => true
  validates_presence_of :password, :on => :create

  #ROLES = Account.all { |username| username }
end
