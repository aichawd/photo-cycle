class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all

    @users = User.where.not(id: current_user.id)
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
    @chatroom = Chatoom.create(name: params['chatroom']['name'])
  end
end
