class AddDayToRoadCar < ActiveRecord::Migration[6.0]
  def change
    add_column :road_cars, :day, :date
  end
end
