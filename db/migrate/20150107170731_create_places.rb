class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :address
      t.boolean :projector, default: false
      t.integer :fit_types, array: true, default: []
      t.string :pictures, array: true, default: []

      t.timestamps
    end
  end
end
