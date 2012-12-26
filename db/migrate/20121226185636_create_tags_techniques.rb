class CreateTagsTechniques < ActiveRecord::Migration
  def change
    create_table :tags_techniques do |t|
      t.integer :tag_id
      t.integer :technique_id

      t.timestamps
    end
  end
end
