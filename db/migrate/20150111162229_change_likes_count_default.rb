class ChangeLikesCountDefault < ActiveRecord::Migration
  def change
    change_column_default :start_ups, :likes_count, 0
  end
end
