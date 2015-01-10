class AddLinkToStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :link, :string
    change_column_default :start_ups, :like_count, 0
  end
end
