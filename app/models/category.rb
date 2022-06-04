class Category < ApplicationRecord
  has_many :photo_categories
  has_many :pictures, through: :photo_categories
end

