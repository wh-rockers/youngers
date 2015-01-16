class ChangePersonDefaultInTopics < ActiveRecord::Migration
  def change
    change_column_default :topics, :presonal, true
  end
end
