class AddPositionToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :position, :string
  end

  def self.down
    remove_column :techniques, :position
  end
end
