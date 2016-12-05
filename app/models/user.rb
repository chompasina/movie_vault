class User < ApplicationRecord
  has_secure_password
  has_many :movies
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, allow_blank: false
  validates :password, confirmation: true, presence: true
end
