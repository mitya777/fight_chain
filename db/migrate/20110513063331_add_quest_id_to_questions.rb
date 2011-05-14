class AddQuestIdToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :quest_id, :integer
  end

  def self.down
    remove_column :questions, :quest_id
  end
end
