class AddTimeToRoadCars < ActiveRecord::Migration[6.0]
  def change
    add_column :road_cars, :time, :float
  end
end
