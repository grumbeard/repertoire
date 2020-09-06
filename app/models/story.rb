class Story < ApplicationRecord
  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy
  has_many_attached :photos

  validates :title, length: { maximum: 140 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :price_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end
