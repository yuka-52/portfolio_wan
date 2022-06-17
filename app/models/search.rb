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

  def self.finder(search, address)
    if address
      @searches = Search.where(["disappeared_place LIKE ?", "%#{address}%"])
      @protections = Protection.where(["protection_place LIKE ?", "%#{address}%"])
      @sights = Sight.where(["sight_place LIKE ?", "%#{address}%"])
    elsif search
      @searches = Search.where([
        "search_title LIKE ? OR dog_breed LIKE ? OR dog_profile LIKE ? OR dog_age LIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
      ])
      @protections = Protection.where([
        "protection_title LIKE ? OR protection_breed LIKE ? OR protection_profile LIKE ? OR protection_choker LIKE ? OR protection_dogtag LIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
      ])
      @sights = Sight.where(["sight_title LIKE ? OR sight_profile LIKE ?", "%#{search}%", "%#{search}%"])
    else
      @searches = Search.all
      @protections = Protection.all
      @sights = Sight.all
    end
  end
end
