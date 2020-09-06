class Story < ApplicationRecord
  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy
  has_many_attached :photos
end
