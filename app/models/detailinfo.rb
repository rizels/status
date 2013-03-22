class Detailinfo < ActiveRecord::Base
  attr_accessible :content, :info_id
  belongs_to :info
  
end
