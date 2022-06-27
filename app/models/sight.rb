class Sight < ApplicationRecord
  validates :sight_title, presence: true
  validates :sight_profile, presence: true, length: { maximum: 500 }
  validates :sight_place, presence: true, length: { maximum: 500 }
  validates :sight_date, presence: true
  validates :sight_contact, presence: true

  mount_uploaders :sight_images, SightImagesUploader
  belongs_to :user
  has_many :boards, dependent: :destroy

  def self.search(search, address)
    if address
      @sights = Sight.where(["sight_place LIKE(?)", "%#{address}%"])
    elsif search
      @sights = Sight.where(["sight_title LIKE(?) OR sight_profile LIKE(?)", "%#{search}%", "%#{search}%"])
    else
      @sights = Sight.all
    end
  end
end
