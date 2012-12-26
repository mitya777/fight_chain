class TagsTechniques < ActiveRecord::Base
  attr_accessible :tag_id, :technique_id

  belongs_to :tag
  belongs_to :technique
end
