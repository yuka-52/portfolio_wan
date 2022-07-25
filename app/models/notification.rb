class Notification < ApplicationRecord
  belongs_to :search, optional: true
  belongs_to :comment, optional: true
  belongs_to :sight, optional: true
  belongs_to :board, optional: true
  belongs_to :room, optional: true
  belongs_to :message, optional: true
  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :visited, class_name: 'User', optional: true
end
