class RemoveUpsToTodos < ActiveRecord::Migration
  def change
  	remove_column :todos, :ups
  end
end
