class RenameDisappearedPlaceColumnToSearches < ActiveRecord::Migration[6.1]
  def change
    rename_column :searches, :disappeared_place, :address
  end
end
