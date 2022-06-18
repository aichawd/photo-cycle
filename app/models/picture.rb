class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :collaboration, optional: true
  has_one_attached :photo, dependent: :destroy
  has_many :photo_categories, dependent: :destroy
  has_many :categories, through: :photo_categories
end
