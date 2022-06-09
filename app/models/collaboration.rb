class Collaboration < ApplicationRecord
  belongs_to :artist1, foreign_key: :artist1_id, class_name: 'User'
  belongs_to :artist2, foreign_key: :artist2_id, class_name: 'User'
  has_many :pictures, dependent: :destroy
end
