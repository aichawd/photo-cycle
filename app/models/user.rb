class User < ApplicationRecord
  has_many :pictures
  has_many :chatrooms, dependent: :destroy
  has_many :messages, through: :chatrooms
  has_one_attached :photo

  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
