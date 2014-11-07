class AddPublicEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :public_email, :boolean, default: true
  end
end
