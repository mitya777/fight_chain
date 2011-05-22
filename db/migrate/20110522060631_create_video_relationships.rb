class CreateVideoRelationships < ActiveRecord::Migration
  def self.up
    create_table :video_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end

  def self.down
    drop_table :video_relationships
  end
end
