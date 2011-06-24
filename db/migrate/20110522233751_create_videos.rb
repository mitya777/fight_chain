class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :technique_id
      t.string :name
      t.string :url
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
