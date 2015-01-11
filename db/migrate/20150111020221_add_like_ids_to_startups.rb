class AddLikeIdsToStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :like_ids, :integer, array: true, default: []
  end
end
