class CreateTopicComments < ActiveRecord::Migration
  def change
    create_table :topic_comments do |t|
      t.text :content
      t.integer :level, default: 0
      t.integer :parent_id, index: true
      t.integer :up_count, default: 0
      t.integer :supporters, array: true, default: []
      t.integer :topic_id, index: true
      t.timestamps
    end
  end
end
