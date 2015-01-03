class ChangeYearsColumnType < ActiveRecord::Migration
  def change
    remove_column :cars, :year, :string

    add_column :cars, :year, :integer, null: false
  end
end
