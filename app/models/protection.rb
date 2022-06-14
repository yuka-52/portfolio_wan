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
  end
end
