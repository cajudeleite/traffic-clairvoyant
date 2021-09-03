class RemoveTimeFromRoadCars < ActiveRecord::Migration[6.0]
  def change
      remove_column :road_cars, :time
  end
end
