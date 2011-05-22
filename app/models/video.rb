class Video < ActiveRecord::Base

  belongs_to :user

  has_many :video_relationships, :foreign_key => "parent_id", :dependent => :destroy
  has_many :children, :through => :video_relationships, :source => :child

  has_many :reverse_video_relationships, :foreign_key => "child_id", :class_name => "VideoRelationship", :dependent => :destroy
  has_many :parents, :through => :reverse_video_relationships, :source => :parent
end
