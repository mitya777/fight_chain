class CreateInspirations < ActiveRecord::Migration
  def self.up
    create_table :inspirations do |t|
      t.string :content
      t.integer :url_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inspirations
  end
end
