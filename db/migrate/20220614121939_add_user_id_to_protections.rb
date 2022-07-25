class AddUserIdToProtections < ActiveRecord::Migration[6.1]
  def change
    add_column :protections, :user_id, :integer
  end
end
