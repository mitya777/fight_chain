class AddSharedToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :shared, :integer
  end

  def self.down
    remove_column :techniques, :shared
  end
end
