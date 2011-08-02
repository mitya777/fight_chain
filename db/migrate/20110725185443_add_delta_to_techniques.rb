class AddDeltaToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :delta, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :techniques, :delta
  end
end
