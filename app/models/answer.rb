class Answer < ActiveRecord::Base
  
  belongs_to :quest

  default_scope :order => 'answers.created_at DESC'
end
