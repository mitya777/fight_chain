class Technique < ActiveRecord::Base

  belongs_to :user

  has_many  :technique_relationships, :foreign_key => "parent_id",
            :dependent => :destroy
  has_many  :children, :through => :technique_relationships, :source => :child

  has_many  :reverse_technique_relationships, :foreign_key => "child_id",
            :class_name => "TechniqueRelationship", :dependent => :destroy
  has_many  :parents, :through => :reverse_technique_relationships, :source => :parent

  has_many :videos
  accepts_nested_attributes_for :videos, :reject_if => :all_blank

  define_index do
    indexes :name
    indexes description
    indexes videos.name
  end

  def add_parent!(parent)
    reverse_technique_relationships.create!(:parent_id => parent.id)
  end

  def add_child!(child)
    technique_relationships.create!(:child_id => child.id)
  end
end
