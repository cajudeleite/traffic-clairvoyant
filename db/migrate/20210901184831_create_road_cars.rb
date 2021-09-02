class CreateRoadCars < ActiveRecord::Migration[6.0]
  def change
    create_table :road_cars do |t|
      t.references :road, null: false, foreign_key: true
      t.string :time
      t.integer :number_of_cars

      t.timestamps
    end
  end
end
