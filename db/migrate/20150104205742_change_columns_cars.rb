class ChangeColumnsCars < ActiveRecord::Migration
  def change
    add_column :cars, :manufacturer_id, :integer, null: false
    remove_column :cars, :make, :string, null: false
  end
end
