class AddRegistrationStateToUser < ActiveRecord::Migration
  def change
    add_column :users, :registration_state, :integer, default: 0
  end
end
