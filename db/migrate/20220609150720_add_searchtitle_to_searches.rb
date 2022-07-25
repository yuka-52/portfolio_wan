class AddSearchtitleToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :search_title, :string
    add_column :searches, :disappeared_date, :date
  end
end
