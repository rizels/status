class Comment < ActiveRecord::Base
  belongs_to :statusupdate
  attr_accessible :body, :commenter
  acts_as_paranoid
  validates :commenter, :body, :presence => true
  validates :commenter, :length => { :minimum => 2 }
  validates :commenter, :length => { :maximum => 20 }
end
