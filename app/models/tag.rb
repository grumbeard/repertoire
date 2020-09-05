class Tag < ApplicationRecord
  belongs_to :tag_category
  has_many :stories, through: :taggings
  has_many :taggings, dependent: :destroy
end
