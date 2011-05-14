class AddQuestIdToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :quest_id, :integer
  end

  def self.down
    remove_column :answers, :quest_id
  end
end
