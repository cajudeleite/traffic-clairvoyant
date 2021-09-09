class AddWeightToOrigin < ActiveRecord::Migration[6.0]
  def change
    add_column :origins, :weight, :integer
  end
end
