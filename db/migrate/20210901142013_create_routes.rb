class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.references :origin, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.references :road, null: false, foreign_key: true
      t.references :origin_destination_route, null: false, foreign_key: true
      t.integer :step
      t.integer :duration

      t.timestamps
    end
  end
end
