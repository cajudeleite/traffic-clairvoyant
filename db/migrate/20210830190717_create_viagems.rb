class CreateViagems < ActiveRecord::Migration[6.0]
  def change
    create_table :viagems do |t|
      t.string :origem
      t.string :destino
      t.date :data
      t.integer :horario
      t.float :tempo_total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
