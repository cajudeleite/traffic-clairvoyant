class ChangeTimeToBeIntegerInTrips < ActiveRecord::Migration[6.0]
  def change
    change_column :trips, :time, :integer
  end
end
