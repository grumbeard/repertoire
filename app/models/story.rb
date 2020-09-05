class Story < ApplicationRecord
  has_many :tags, through: :taggings
end
