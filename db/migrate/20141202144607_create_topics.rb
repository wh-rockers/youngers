class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
