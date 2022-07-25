class AddContactToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :contact, :string
  end
end
