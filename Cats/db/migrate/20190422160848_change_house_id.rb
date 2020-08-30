class ChangeHouseId < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :house_type, :string, null: true
  end
end
