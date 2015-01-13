class AddLocationTopics < ActiveRecord::Migration
  def change
    add_column :topics, :location, :string
    add_column :topics, :start_time, :datetime
    add_column :topics, :end_time, :datetime
    add_column :topics, :attendee_number, :integer, default: 10
    add_column :topics, :tags, :string, array: true, default: []
  end
end
