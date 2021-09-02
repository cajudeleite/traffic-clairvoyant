class AddDirectionToRoad < ActiveRecord::Migration[6.0]
  def change
    add_column :roads, :direction, :string
  end
end
