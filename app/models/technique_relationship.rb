class TechniqueRelationship < ActiveRecord::Base
  
  belongs_to :parent, :class_name => "Technique"
  belongs_to :child, :class_name => "Technique"
end
