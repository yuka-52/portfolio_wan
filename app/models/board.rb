class Board < ApplicationRecord
  validates :board_content, presence: true

  belongs_to :user
  belongs_to :sight
  has_many :notifications, dependent: :destroy
end
