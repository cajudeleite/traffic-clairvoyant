class ChangeTimeToBeIntegerInRoadCars < ActiveRecord::Migration[6.0]
  def change
    change_column :road_cars, :time, :integer
  end
end
