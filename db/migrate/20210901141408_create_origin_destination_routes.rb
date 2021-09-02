class CreateOriginDestinationRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :origin_destination_routes do |t|
      t.references :origin, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
