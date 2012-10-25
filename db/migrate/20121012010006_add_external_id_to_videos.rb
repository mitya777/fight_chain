class AddExternalIdToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :external_id, :string
  end

  def self.down
    remove_column :videos, :external_id
  end
end
