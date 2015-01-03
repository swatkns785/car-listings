class AddCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make, null: false
      t.string :color, null: false
      t.string :year, null: false
      t.integer :mileage, null: false
      t.text :description
      t.timestamps
    end
  end
end
