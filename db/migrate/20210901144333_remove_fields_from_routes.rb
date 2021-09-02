class RemoveFieldsFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :origin_id
    remove_column :routes, :destination_id
  end
end
