class AddAttrisToWeixinAccounts < ActiveRecord::Migration
  def change
    add_column :weixin_accounts, :nickname, :string
    add_column :weixin_accounts, :sex, :integer
    add_column :weixin_accounts, :language, :string
    add_column :weixin_accounts, :city, :string
    add_column :weixin_accounts, :province, :string
    add_column :weixin_accounts, :country, :string
    add_column :weixin_accounts, :headimgurl, :string
  end
end
