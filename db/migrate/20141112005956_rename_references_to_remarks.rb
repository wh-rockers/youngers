class RenameReferencesToRemarks < ActiveRecord::Migration
  def change
  	rename_column :remarks, :user_id_id, :user_id
  end
end
