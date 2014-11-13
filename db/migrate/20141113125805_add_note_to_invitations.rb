class AddNoteToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :note, :text
  end
end
