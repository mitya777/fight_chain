class RenameTechniquesType < ActiveRecord::Migration
  def self.up
    rename_column :techniques, :type, :skill
  end

  def self.down
    rename_column :techniques, :skill, :type
  end
end
