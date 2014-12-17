class AddTitleToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :title, :string
    add_column :topics, :supporters, :integer, array: true, default: []
    add_column :topics, :up_count, :integer, default: 0
    add_column :topics, :wanna_join_users, :integer, array: true, default: []
  end
end
