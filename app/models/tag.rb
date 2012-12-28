class Tag < ActiveRecord::Base
  DEFAULT_TAGS = [
    {:name => "standup", :kind => "position"},
    {:name => "closed guard", :kind => "position"},
    {:name => "open guard", :kind => "position"},
    {:name => "half guard", :kind => "position"},
    {:name => "butterfly guard", :kind => "position"},
    {:name => "delariva guard", :kind => "position"},
    {:name => "spider guard", :kind => "position"},
    {:name => "turtle guard", :kind => "position"},
    {:name => "side mount", :kind => "position"},
    {:name => "mount", :kind => "position"},
    {:name => "knee on belly", :kind => "position"},
    {:name => "north south", :kind => "position"},
    {:name => "back mount", :kind => "position"},  

    {:name => "grips", :kind => "skill"},
    {:name => "takedown", :kind => "skill"},
    {:name => "takedown defense", :kind => "skill"},
    {:name => "submission", :kind => "skill"},
    # choke? joint-lock?
    {:name => "pass", :kind => "skill"},
    {:name => "sweep", :kind => "skill"},
    {:name => "back take", :kind => "skill"},
    {:name => "transition", :kind => "skill"},
  ]

  attr_accessible :description, :name, :kind

  has_many :tags_techniques
  has_many :techniques, :through => :tags_techniques
 
  validates :name, :presence => true, :length => {:maximum => 30}, :uniqueness => {:case_sensitive => :false}

  def self.default_tags
    DEFAULT_TAGS
  end
end
