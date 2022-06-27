class Board < ApplicationRecord
  validates :board_content, presence: true

  belongs_to :user
  belongs_to :sight
end
