class AddSightIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :sight_id, :integer
    add_column :notifications, :board_id, :integer
 
    add_index :notifications, :sight_id
    add_index :notifications, :board_id
  end
end
