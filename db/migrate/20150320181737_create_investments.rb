class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :investors, array: true, default: []
      t.string :level
      t.integer :amount
      t.belongs_to :start_ups, index: true
      t.timestamps
    end
  end
end
