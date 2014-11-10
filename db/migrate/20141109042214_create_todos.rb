class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.integer :ups
      t.integer :status

      t.timestamps
    end
  end
end
