class Comment
  include Mongoid::Document
  include Mongoid::Paranoia
  

  attr_accessible :body, :commenter

  field :commenter, :type => String
  field :body, :type => String
  field :deleted_at, :type => Time
  
  #acts_as_paranoid

  validates :commenter, :body, :presence => true
  validates :commenter, :length => { :minimum => 2 }
  validates :commenter, :length => { :maximum => 20 }

  embedded_in :statusupdate, :inverse_of => :comments
end
