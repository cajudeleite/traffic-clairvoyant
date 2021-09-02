class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :date
      t.float :time
      t.references :user, null: false, foreign_key: true
      t.references :origin_destination_routes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
