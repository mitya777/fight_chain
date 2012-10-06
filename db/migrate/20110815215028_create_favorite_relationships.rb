class CreateFavoriteRelationships < ActiveRecord::Migration
  def self.up
    create_table :favorite_relationships do |t|
      t.integer :user_id
      t.integer :technique_id

      t.timestamps
    end
  end

  def self.down
    drop_table :favorite_relationships
  end
end
