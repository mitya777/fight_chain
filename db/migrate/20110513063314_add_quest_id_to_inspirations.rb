class AddQuestIdToInspirations < ActiveRecord::Migration
  def self.up
    add_column :inspirations, :quest_id, :integer
  end

  def self.down
    remove_column :inspirations, :quest_id
  end
end
