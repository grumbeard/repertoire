class Story < ApplicationRecord
  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy
end
