class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.string :content
      t.references :user_id, index: true
      t.integer :supporters, array: true, default: []

      t.timestamps
    end
  end
end
