class Statusupdate < ActiveRecord::Base
  attr_accessible :content, :updatetime, :username

  acts_as_paranoid

  validates :username, :content, :presence => true
  validates :username, :length => { :minimum => 2 }
  validates :username, :length => { :maximum => 20 }

  has_many :comments, :dependent => :destroy
end
