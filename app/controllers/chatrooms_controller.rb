class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    #@chatroom = Chatroom.new
    @chatrooms = current_user.chatrooms

    #@users = User.where.not(id: current_user.id)
    render 'index'
  end

  def show

    @chatroom  =  Chatroom.find(params[:id])

    @chatrooms = Chatroom.all

    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :asc)

    @users = User.where.not(id: current_user.id)
  end

  def create
    @chatroom = Chatroom.create(name: params['chatroom']['name'])
  end
end
