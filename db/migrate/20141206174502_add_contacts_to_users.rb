class AddContactsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq_number, :string
    add_column :users, :weixin_number, :string
    add_column :users, :phone_number, :string
  end
end
