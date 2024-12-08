class User < ApplicationRecord
  has_secure_password

  has_many :notifications

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end
