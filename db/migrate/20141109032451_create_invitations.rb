class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :state, default: 0

      t.timestamps
    end
    add_index :invitations, :from_user_id
    add_index :invitations, :to_user_id
  end
end
