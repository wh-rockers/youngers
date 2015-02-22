class CreateWeixinAccounts < ActiveRecord::Migration
  def change
    create_table :weixin_accounts do |t|
      t.belongs_to :user, index: true
      t.boolean :following
      t.string :open_id, index: true
      t.timestamps
    end
    remove_column :users, :open_id, :string
  end
end
