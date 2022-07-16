class Search < ApplicationRecord
  validates :search_title, presence: true
  validates :dog_breed, presence: true
  validates :dog_age, presence: true, numericality: true
  validates :dog_profile, presence: true, length: { maximum: 400 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :disappeared_date, presence: true
  validates :contact, presence: true
  validates :dog_images, presence: true

  mount_uploaders :dog_images, DogImgUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

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

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(search_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      search_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
