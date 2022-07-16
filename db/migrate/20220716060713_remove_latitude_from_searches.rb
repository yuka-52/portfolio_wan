class RemoveLatitudeFromSearches < ActiveRecord::Migration[6.1]
  def change
    remove_column :searches, :latitude, :float
    remove_column :searches, :longitude, :float
  end
end
