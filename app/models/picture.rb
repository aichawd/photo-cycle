class Picture < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :photo_categories
  has_many :categories, through: :photo_categories
end
