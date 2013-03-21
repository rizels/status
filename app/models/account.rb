class Account < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username, :image, :remote_image_url
  has_secure_password
  validates :username, :presence => true, :length => {:minimum => 2}, :uniqueness => true
  validates_presence_of :password, :on => :create
  validates :password, :password_confirmation, :length => {:minimum => 6}, :if => Proc.new{|a| !a.password.nil?}

  mount_uploader :image, ImageUploader
  #ROLES = Account.all { |username| username }
end
