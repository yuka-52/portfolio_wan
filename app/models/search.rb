class Search < ApplicationRecord
  validates :search_title, presence: true
  validates :dog_breed, presence: true
  validates :dog_age, presence: true, numericality: true
  validates :dog_profile, presence: true, length: { maximum: 400 }
  validates :disappeared_place, presence: true, length: { maximum: 400 }
  validates :disappeared_date, presence: true
  validates :contact, presence: true
  validates :dog_images, presence: true

  mount_uploaders :dog_images, DogImgUploader
  belongs_to :user
end
