class CreateTechniqueRelationships < ActiveRecord::Migration
  def self.up
    create_table :technique_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end

  def self.down
    drop_table :technique_relationships
  end
end
