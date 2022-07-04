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
  has_many :comments, dependent: :destroy

  def self.finder(search, address)
    if address
      @searches = Search.where(["disappeared_place LIKE(?)", "%#{address}%"])
    elsif search
      @searches = Search.where([
        "search_title LIKE(?) OR dog_breed LIKE(?) OR dog_profile LIKE(?)
         OR dog_age LIKE(?) ",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
      ])
    else
      @searches = Search.all
    end
  end
end
