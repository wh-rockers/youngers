class AddGroupCodeToInvitationCodes < ActiveRecord::Migration
  def change
    add_column :invitation_codes, :group_code, :boolean, default: false
    add_column :invitation_codes, :used_by_ids, :integer, array: true, default: []
    
    reversible do |dir|
    dir.up do 
      InvitationCode.find_each do |code|
        code.update_attributes(used_by_ids: [code.used_by])
      end
      remove_column :invitation_codes, :used_by
    end

    dir.down do
      add_column :invitation_codes, :used_by, :integer
      InvitationCode.find_each do |code|
        code.update_attributes(used_by: code.used_by_ids.first)
      end
    end
  end
  end
end
