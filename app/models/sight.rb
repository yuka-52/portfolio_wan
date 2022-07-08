class Sight < ApplicationRecord
  validates :sight_title, presence: true
  validates :sight_profile, presence: true, length: { maximum: 500 }
  validates :sight_place, presence: true, length: { maximum: 500 }
  validates :sight_date, presence: true
  validates :sight_contact, presence: true

  mount_uploaders :sight_images, SightImagesUploader
  belongs_to :user
  has_many :boards, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def self.search(search, address)
    if address
      @sights = Sight.where(["sight_place LIKE(?)", "%#{address}%"])
    elsif search
      @sights = Sight.where(["sight_title LIKE(?) OR sight_profile LIKE(?)", "%#{search}%", "%#{search}%"])
    else
      @sights = Sight.all
    end
  end

  def create_notification_board!(current_user, board_id)
    temp_ids = Board.select(:user_id).where(sight_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_board!(current_user, board_id, temp_id['user_id'])
    end
    save_notification_board!(current_user, board_id, user_id) if temp_ids.blank?
  end

  def save_notification_board!(current_user, board_id, visited_id)
    notification = current_user.active_notifications.new(
      sight_id: id,
      board_id: board_id,
      visited_id: visited_id,
      action: 'board'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
