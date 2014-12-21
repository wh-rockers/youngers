class AddCommentCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :topic_comments_count, :integer, default: 0
    add_column :topic_comments, :user_id, :integer, index: true
  end
end
