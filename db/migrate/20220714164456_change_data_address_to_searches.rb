class ChangeDataAddressToSearches < ActiveRecord::Migration[6.1]
  def change
    change_column :searches, :address, :string
  end
end
