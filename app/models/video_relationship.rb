class VideoRelationship < ActiveRecord::Base

  belongs_to :parent, :class_name => "Video"
  belongs_to :child, :class_name => "Video"
end
