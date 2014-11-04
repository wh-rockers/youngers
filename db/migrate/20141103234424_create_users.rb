class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :skill
      t.text :desc
      t.string :corp
      t.string :position
      t.string :name

      t.timestamps
    end
  end
end
