class AddFromUrlToStartUps < ActiveRecord::Migration
  def change
    add_column :start_ups, :from_url, :string
  end
end
