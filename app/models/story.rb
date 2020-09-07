class Story < ApplicationRecord
  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy
  has_many_attached :photos

  validates :title, length: { maximum: 140 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90, allow_nil: true }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180, allow_nil: true }
  validates :price_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3, allow_nil: true }

  # Utilize Geocoder to update address or coordinates from presence / change of either
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: :coordinates_to_change?

  def coordinates_to_change?
    will_save_change_to_latitude? || will_save_change_to_longitude?
  end
end
