class CreateSights < ActiveRecord::Migration[6.1]
  def change
    create_table :sights do |t|
      t.integer :user_id
      t.string :sight_title
      t.text :sight_profile
      t.text :sight_place
      t.date :sight_date
      t.json :sight_images
      t.text :sight_contact

      t.timestamps
    end
  end
end
