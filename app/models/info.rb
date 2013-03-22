class Info < ActiveRecord::Base
  attr_accessible :name, :detailinfos_attributes
  has_many :detailinfos, :dependent => :destroy
  accepts_nested_attributes_for :detailinfos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
