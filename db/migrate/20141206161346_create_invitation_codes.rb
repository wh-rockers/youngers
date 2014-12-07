class CreateInvitationCodes < ActiveRecord::Migration
  def change
    create_table :invitation_codes do |t|
      t.references :user, index: true
      t.integer :used_by
      t.string :code

      t.timestamps
    end
  end
end
