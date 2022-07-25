class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :dog_name
      t.string :dog_breed
      t.integer :dog_age
      t.text :dog_profile
      t.text :disappeared_place
      t.string :dog_img

      t.timestamps
    end
  end
end
