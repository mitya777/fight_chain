class AddTypeToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :type, :string
  end

  def self.down
    remove_column :techniques, :type
  end
end
