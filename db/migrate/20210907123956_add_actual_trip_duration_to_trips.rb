class AddActualTripDurationToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :actual_duration, :integer
  end
end
