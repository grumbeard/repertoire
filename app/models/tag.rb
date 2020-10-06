class Tag < ApplicationRecord
  belongs_to :tag_category
  belongs_to :user
  has_many :stories, through: :taggings
  has_many :taggings, dependent: :destroy
end
