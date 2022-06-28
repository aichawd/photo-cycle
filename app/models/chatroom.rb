class Chatroom < ApplicationRecord
  belongs_to :first_user, :class_name => "User"
  belongs_to :second_user, :class_name => 'User'
  has_many :messages, dependent: :destroy

 
  # after_create_commit { broadcast_append_to "chatrooms"}

  def self.create_private_chatroom(first_user, second_user )
    return if first_user == second_user

    Chatroom.create(first_user: first_user, second_user: second_user)
  end

  def interlocutor(user)
    ([first_user, second_user] - [user]).first
  end
end
