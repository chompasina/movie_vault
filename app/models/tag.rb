class Tag < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :movie_tags
  has_many :movies, through: :movie_tags
end
