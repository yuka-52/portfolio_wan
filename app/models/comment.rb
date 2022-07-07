class Comment < ApplicationRecord
  validates :comment_content, presence: true

  belongs_to :user
  belongs_to :search
  has_many :notifications, dependent: :destroy

end
