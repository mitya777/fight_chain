class Inspiration < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :quest

  default_scope :order => 'inspirations.created_at DESC'
end
