class MessagesController < ApplicationController
  def create

    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.sender = current_user


    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          html: render_to_string(partial: "message", locals: { message: @message }),
        # broadcast the current_user's id so it is possible to verify in the
        # stimulus controller if it corresponds or not with
        # the client's current_user
          user_id: @message.sender.id
        }
        )
        head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end
  def message_params
    params.require(:message).permit(:content)
  end
end
