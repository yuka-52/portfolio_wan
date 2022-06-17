class Protection < ApplicationRecord
  validates :protection_title, presence: true
  validates :protection_breed, presence: true
  validates :protection_profile, presence: true, length: { maximum: 500 }
  validates :protection_place, presence: true, length: { maximum: 500 }
  validates :protection_date, presence: true
  validates :protection_contact, presence: true
  validates :protection_images, presence: true
  validates :protection_choker, presence: true
  validates :protection_dogtag, presence: true
  validates :contacted_institution, presence: true

  mount_uploaders :protection_images, ProtectionImagesUploader
  belongs_to :user

  def self.search(search, address)
    if address
      @protections = Protection.where(["protection_place LIKE(?)", "%#{address}%"])
    elsif search
      @protections = Protection.where(["protection_title LIKE(?) OR protection_breed LIKE(?) OR protection_profile LIKE(?) OR protection_choker LIKE(?) OR protection_dogtag LIKE(?)", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      @protections = Protection.all
    end
  end
end
