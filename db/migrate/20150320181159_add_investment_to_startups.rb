class AddInvestmentToStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :weibo, :string
    change_column :start_ups, :desc, :text
  end
end
