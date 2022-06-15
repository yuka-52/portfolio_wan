class Sight < ApplicationRecord
  validates :sight_title, presence: true
  validates :sight_profile, presence: true, length: { maximum: 500 }
  validates :sight_place, presence: true, length: { maximum: 500 }
  validates :sight_date, presence: true
  validates :sight_contact, presence: true
  validates :sight_contact, presence: true
    
  mount_uploaders :sight_images, SightImagesUploader
  belongs_to :user
end
