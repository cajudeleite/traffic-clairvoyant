class AddReceivedNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :received, :boolean, default: false, null: false
  end
end
