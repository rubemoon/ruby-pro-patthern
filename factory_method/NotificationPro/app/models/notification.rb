class Notification < ApplicationRecord
  belongs_to :user

  self.inheritance_column = :_type_disabled # Disable STI

  validates :notification_type, presence: true
  validates :message, presence: true
end
