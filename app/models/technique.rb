class Technique < ActiveRecord::Base

  belongs_to :user

  has_many  :technique_relationships, :foreign_key => "parent_id",
            :dependent => :destroy
  has_many  :children, :through => :technique_relationships, :source => :child, :order => "created_at DESC"

  has_many  :reverse_technique_relationships, :foreign_key => "child_id",
            :class_name => "TechniqueRelationship", :dependent => :destroy
  has_many  :parents, :through => :reverse_technique_relationships, :source => :parent, :order => "created_at DESC"

  has_many :videos
  accepts_nested_attributes_for :videos, :reject_if => :all_blank

  define_index do
    indexes :name
    indexes description
    indexes videos.name

    has user_id, :as => :user_id
  end

  default_scope :order => 'techniques.created_at DESC'

  def possible_parents(user)
    if belongs_to? user
      user.techniques - (self.parents + [self])
    else 
      raise "You are not the owner of this technique!"
    end
  end

  def possible_children(user)
    if belongs_to? user
      user.techniques - (self.children + [self])
    else 
      raise "You are not the owner of this technique!"
    end
  end

  def belongs_to?(user)
    self.user_id == user.id 
  end
end
