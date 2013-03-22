class Account
	include BCrypt
	include Mongoid::Document
  include ActiveModel::SecurePassword
  include ::CarrierWave

  attr_accessible :password, :password_confirmation, :username, :image, :remote_image_url

  field :username, :type => String
  field :password_digest, :type => String
  field :image, :type => String
  field :role, :type => String

  has_secure_password

  validates :username, :presence => true, :length => {:minimum => 2}, :uniqueness => true
  validates_presence_of :password, :on => :create
  validates :password, :password_confirmation, :length => {:minimum => 6}, :if => Proc.new{|a| !a.password.nil?}

  mount_uploader :image, ImageUploader
end
