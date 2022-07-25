class AddDogImagesToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :dog_images, :json
  end
end
