class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, :class_name => "User"
  #after_create_commit { broadcast_append_to chatroom }
end
