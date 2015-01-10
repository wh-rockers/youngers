class AddUserIdToStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :user_id, :integer, index: true
  end
end
