class CreateStartUps < ActiveRecord::Migration
  def change
    create_table :start_ups do |t|
      t.string :logo_url
      t.string :name
      t.integer :likes_count
      t.string :desc

      t.timestamps
    end
  end
end
