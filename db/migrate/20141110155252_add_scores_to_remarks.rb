class AddScoresToRemarks < ActiveRecord::Migration
  def change
  	add_column :remarks, :score, :integer
  end
end
