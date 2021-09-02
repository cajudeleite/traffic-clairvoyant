class CreateRoads < ActiveRecord::Migration[6.0]
  def change
    create_table :roads do |t|
      t.string :name
      t.string :code
      t.string :stretch

      t.timestamps
    end
  end
end
