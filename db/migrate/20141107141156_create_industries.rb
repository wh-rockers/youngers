class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :abbr

      t.timestamps
    end
    add_column :users, :industry_id, :integer, index: true
  end
end
