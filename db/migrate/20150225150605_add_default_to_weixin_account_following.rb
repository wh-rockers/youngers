class AddDefaultToWeixinAccountFollowing < ActiveRecord::Migration
  def change
    change_column :weixin_accounts, :following, :boolean, default: true
  end
end
