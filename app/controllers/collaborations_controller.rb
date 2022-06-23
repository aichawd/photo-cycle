class CollaborationsController < ApplicationController
  before_action :set_collab, only: [:show, :update, :destroy]

  def index
    my_id = current_user.id
    @validated_collabs = Collaboration.where(["artist1_id = ? or artist2_id = ?", my_id, my_id]).where(status: 1)
    @sent_pending = Collaboration.where(artist1: current_user).where(status: 0)
    @sent_refused = Collaboration.where(artist1: current_user).where(status: 2)
    @received_pending = Collaboration.where(artist2: current_user).where(status: 0)
    @received_refused = Collaboration.where(artist2: current_user).where(status: 2)
  end

  def new
    @collab = Collaboration.new
  end

  def create
    @collab = Collaboration.new(collab_params)
    @collab.artist1 = current_user
    @receiver = User.find_by(username: params[:artist2])
    @collab.artist2 = @receiver
    if @collab.save
      redirect_to gallery_path(@receiver.username), notice: "Collaboration request sent"
    else
      render :new
    end
  end

  def show
    @collab_pictures = Picture.where(collaboration_id: @collab.id)
    @artist1 = User.find(@collab.artist1_id)
    @artist2 = User.find(@collab.artist2_id)
  end

  def update
    @collab.update(status: params["status"])
    respond_to do |format|
      format.html { redirect_to collaborations_path }
      format.text { redirect_to collaborations_path }
    end
  end

  def destroy
    @collab.destroy
    redirect_to collaborations_path
  end

  private

  def set_collab
    @collab = Collaboration.find(params[:id])
  end

  def collab_params
    params.require(:collaboration).permit(:name, :status, :artist1_id, :artist2_id, :description)
  end
end
