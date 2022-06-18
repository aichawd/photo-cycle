class User < ApplicationRecord

  has_many :pictures, dependent: :destroy
  has_many :messages, through: :chatrooms
  has_one_attached :photo
  has_many :chatrooms_as_first_user, :class_name => 'Chatroom', :foreign_key => 'first_user_id', dependent: :destroy
  has_many :chatrooms_as_second_user, :class_name => 'Chatroom', :foreign_key => 'second_user_id', dependent: :destroy

  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def chatrooms
          chatrooms_as_first_user + chatrooms_as_second_user
         end
end
