class CreateProtections < ActiveRecord::Migration[6.1]
  def change
    create_table :protections do |t|
      t.json :protection_images
      t.string :protection_title
      t.string :protection_breed
      t.text :protection_profile
      t.text :protection_place
      t.date :protection_date
      t.text :protection_contact
      t.string :protection_choker
      t.string :protection_dogtag
      t.text :contacted_institution

      t.timestamps
    end
  end
end
