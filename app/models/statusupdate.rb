class Statusupdate

  include Mongoid::Document
  include Mongoid::Paranoia

  attr_accessible :content, :updatetime, :username

  field :username, :type => String
  field :content, :type => String
  field :deleted_at, :type => Time
  field :updatetime, :type => DateTime

  #acts_as_paranoid

  validates :username, :content, :presence => true
  validates :username, :length => { :minimum => 2 }
  validates :username, :length => { :maximum => 20 }

  def self.ignore_paranoia
    all.tap {|criteria| criteria.selector.delete(:deleted_at)}
  end

  embeds_many :comments
end
