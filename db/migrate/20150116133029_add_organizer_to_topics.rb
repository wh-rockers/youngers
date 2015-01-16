class AddOrganizerToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :organizer, :string
  end
end
